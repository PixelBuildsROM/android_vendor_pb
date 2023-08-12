include vendor/pb/config/BoardConfigKernel.mk

ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/pb/config/BoardConfigQcom.mk
endif

include vendor/pb/config/BoardConfigSoong.mk
