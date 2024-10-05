#!/usr/bin/env python3

import OpenEXR
import Imath
import numpy as np
import matplotlib.pyplot as plt
import logging
import sys

def process_channel_data(exr_file, header, size):
	channel_data = {}
	channels = header['channels'].keys()
	pt = Imath.PixelType(Imath.PixelType.HALF)
	for c in channels:
		try:
			channel = header['channels'][c]
			x_sampling, y_sampling = channel.xSampling, channel.ySampling
			buffer = exr_file.channel(c, pt)
			data = np.frombuffer(buffer, dtype=np.float16)
			new_size = (size[0] // x_sampling, size[1] // y_sampling)
			reshaped_data = data.reshape(-1)
			channel_data[c] = reshaped_data[:new_size[0] * new_size[1]].reshape(new_size[1], new_size[0])
			logging.info(f"Processed channel '{c}' with subsampling {x_sampling}x{y_sampling} and reshaped to {new_size[1]}x{new_size[0]}")
		except Exception as e:
			logging.error(f"Error processing channel {c}: {e}")
			# Optionally, add or raise an exception here if you want the process to stop at the first error
			# raise
	return channel_data

def plot_channel_data(channel_data):
	try:
		if len(channel_data) > 0:
			fig, axs = plt.subplots(1, len(channel_data), figsize=(15, 5))
			for i, c in enumerate(channel_data):
				axs[i].imshow(channel_data[c], cmap='gray')
				axs[i].set_title(c)
			plt.show()
			logging.info("Plotting completed.")
		else:
			logging.warning("No channel data available for plotting.")
	except Exception as e:
		logging.error(f"Error during plotting: {e}")
		
def main(file_path):
	logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')
	logging.info(f"Processing EXR file: {file_path}")
	
	try:
		# Open the EXR file manually without using a context manager
		exr_file = OpenEXR.InputFile(file_path)
		header = exr_file.header()
		dw = header['dataWindow']
		size = (dw.max.x - dw.min.x + 1, dw.max.y - dw.min.y + 1)
		logging.info(f"Image size: {size[0]} x {size[1]}")
		
		channel_data = process_channel_data(exr_file, header, size)
		plot_channel_data(channel_data)
		
		# Make sure to close the file manually
		exr_file.close()
		logging.info("EXR file processing completed and closed.")
	except Exception as e:
		logging.error(f"Error processing EXR file: {e}")
		
if __name__ == "__main__":
	file_path = sys.argv[1] if len(sys.argv) > 1 else '/mnt/file.exr
	main(file_path)
	
