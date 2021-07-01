include vendor/prototype/config/BoardConfigKernel.mk

ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/prototype/config/BoardConfigQcom.mk
endif

include vendor/prototype/config/BoardConfigSoong.mk
