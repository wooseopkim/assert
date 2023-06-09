.DELETE_ON_ERROR:

.PHONY: all
all: actions workflows

.DEFAULT: init
.PHONY: init
init: .git/hooks/README

GIT_HOOKS_PATH:=.githooks
.git/hooks/README:
	@echo See $(GIT_HOOKS_PATH) instead. > $@
	@git config core.hooksPath $(GIT_HOOKS_PATH)


.PHONY: actions
actions: $(patsubst templates/%/.env,%/action.yml,$(wildcard templates/*/.env))

.PHONY: workflows
workflows: $(patsubst templates/%/.env,.github/workflows/%.yml,$(wildcard templates/*/.env))

%/action.yml: scripts/action templates/%/.env templates/action.yml
	@./scripts/action $* $@

.github/workflows/%.yml: scripts/workflow templates/%/.env templates/%/testdata.json templates/workflow.yml
	@./scripts/workflow $* $@

*/action.yml .github/workflows/*.yml: $(wildcard scripts/common/*) templates/header.txt


.PHONY: clean
clean:
	@$(RM) $(filter-out $(wildcard templates/*),$(wildcard */action.yml .github/workflows/*.yml))
