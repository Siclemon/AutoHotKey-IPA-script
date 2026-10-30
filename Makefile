
# Repository
SCRIPT := ./IPA.ahk
SCRIPT_NAME := $(notdir $(SCRIPT))

# Destination Windows
WIN_USER := $(shell cd /mnt/c && powershell.exe -NoProfile -Command '$$env:USERNAME' | tr -d '\r')
WIN_DEST := /mnt/c/Users/$(WIN_USER)/Documents/AutoHotkey
WIN_SCRIPT := $(WIN_DEST)/$(SCRIPT_NAME)

# Colors
RESET  := \033[0m
BOLD   := \033[1m
RED    := \033[31m
GREEN  := \033[32m
YELLOW := \033[33m
BLUE   := \033[34m
MAGENTA:= \033[35m
CYAN   := \033[36m
WHITE  := \033[37m
BLACK  := \033[30m

BG_RED     := \033[41m
BG_GREEN   := \033[42m
BG_YELLOW  := \033[43m
BG_BLUE    := \033[44m
BG_MAGENTA := \033[45m
BG_CYAN    := \033[46m
BG_WHITE   := \033[47m
BG_BLACK   := \033[40m

# text color function
# Color function: COLOR(color, background, message)
COLOR = $(foreach c,$(strip $(1) $(2)),$($(c)))$(3)$(RESET)

#BOLD text color function
# Color function: COLOR_BOLD(color, background, message)
COLOR_BOLD = $(BOLD)$(call COLOR,$(1),$(2),$(3))

# Logging functions
define INFO
	@echo "$(call COLOR,BLACK,BG_CYAN, [INFO] ):$(1)"
endef

define WARN
	@echo "$(call COLOR,BLACK,BG_YELLOW, [WARN] ):$(1)"
endef

define ERR
	@echo "$(call COLOR,BLACK,BG_RED, [ERR ] ):$(1)"
endef

define DONE
	@echo "$(call COLOR,BLACK,BG_GREEN, [DONE] ):$(1)"
endef

define ALLDONE
	@echo "$(GREEN)$(1)$(RESET)"
endef

# test:
# 	$(call INFO, testing how it works)
# 	$(call WARN, testing how it works)
# 	$(call ERR, testing how it works)
# 	$(call DONE, testing how it works)
# 	$(call ALLDONE, testing how it works)

# Depuis WSL
# Deploy from WSL
deploy:
	$(call INFO, Deploying $(SCRIPT) from WSL to Windows...)
	@mkdir -p "$(WIN_DEST)"
	@cp "$(SCRIPT)" "$(WIN_SCRIPT)"
	$(call DONE, Deployment completed.)

# Remove deployed script
clean:
	$(call INFO, Removing deployed script...)
	@rm -f "$(WIN_SCRIPT)"
	$(call DONE, Script removed.)


# WORK IN PROGRESS

# WIN_AUTOHOTKEY_EXE := /mnt/c/Program Files/AutoHotkey/v2/AutoHotkey.exe #TODO: FOX ME

# # Deploy and run from WSL
# run: deploy
# 	$(call INFO, Launching AutoHotkey...)
# 	@"$(WIN_AUTOHOTKEY_EXE)" "$(WIN_SCRIPT)"
# 	$(call ALLDONE, Script launched from Windows.)

# # Stop running AutoHotkey script
# stop:
# 	$(call INFO, Stopping IPA...)
# 	@powershell.exe -NoProfile -Command \
# 		"Get-CimInstance Win32_Process -Filter \"Name = 'AutoHotkey.exe'\" | Where-Object { $$_.CommandLine -like '*IPA.ahk*' } | ForEach-Object { Stop-Process -Id $$_.ProcessId -Force }"
# 	$(call DONE, Script stopped.)

# # Restart script
# restart: stop deploy
# 	$(call INFO, Restarting IPA...)
# 	@"$(WIN_AUTOHOTKEY_EXE)" "$(WIN_SCRIPT)"
# 	$(call DONE, Script restarted.)

.PHONY: deploy run clean restart