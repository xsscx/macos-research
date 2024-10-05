# Color definitions
BLUE := $(shell tput setaf 4)
GREEN := $(shell tput setaf 2)
WHITE := $(shell tput setaf 7)
RED := $(shell tput setaf 1)
RESET := $(shell tput sgr0)

# Logging macros
define log
	@echo "$(WHITE)[$(PROJECT_DISPLAY_NAME)] - $(1)$(RESET)"
endef

define log_build
	@echo "$(WHITE)[$(PROJECT_DISPLAY_NAME)] - $(1)$(RESET)"
endef

define log_info
	@echo "$(GREEN)[$(PROJECT_DISPLAY_NAME)] - $(1)$(RESET)"
endef

define log_clean
	@echo "$(RED)[$(PROJECT_DISPLAY_NAME)] - $(1)$(RESET)"
endef

define log_die
	@echo "$(RED)$(1)$(RESET)"
	@exit 1
endef

