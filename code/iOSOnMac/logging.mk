# logging.mk for iOS/macOS Application Development

# Verbosity Control
export VERBOSE ?= 0

# Control Echoing Based on VERBOSE
ifeq ($(VERBOSE),0)
.SILENT:
endif

# Define Color Codes for Logging
define BLUE
    @echo "\033[0;36m$(1)\033[0m"
endef
define GREEN
    @echo "\033[0;32m$(1)\033[0m"
endef
define WHITE
    @echo "\033[0;37m$(1)\033[0m"
endef
define RED
    @echo "\033[0;31m$(1)\033[0m"
endef

# Set Project Display Name
export PROJECT_DISPLAY_NAME := $(or $(PROJECT_NAME), $(notdir $(shell pwd)))

# Define Logging Functions
define log
    @echo "[`date +"%Y-%m-%d %H:%M:%S"`] [$(PROJECT_DISPLAY_NAME)] - $(1)"
endef
define log_build
    $(call BLUE, "[Build] [$(notdir $(shell pwd))] $(1)")
endef
define log_clean
    $(call WHITE, "[Clean] [$(notdir $(shell pwd))] $(1)")
endef
define log_die
    $(call RED, "[Error] $(1)"; exit 1)
endef
define check_path
    @which $(1) >/dev/null || { $(call RED, "[Check] [$(PROJECT_DISPLAY_NAME)] - Command not found: $(1)"); exit 1; }
endef
define log_info
    $(call GREEN, "[Info] [$(notdir $(shell pwd))] $(1)")
endef
define log_warning
    $(call RED, "[Warning] [$(notdir $(shell pwd))] $(1)")
endef
