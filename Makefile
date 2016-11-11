ARCHS = armv7 arm64
TARGET = iphone::9.2:9.0
THEOS_DEVICE_IP = 192.168.1.2

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = snapfolder
snapfolder_FILES = Tweak.xm
snapfolder_PRIVATE_FRAMEWORKS = MobileCoreServices FrontBoard
include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
