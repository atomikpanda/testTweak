GO_EASY_ON_ME = 1

ARCHS = armv7 armv7s arm64

TARGET = iphone:clang:latest:7.0

include theos/makefiles/common.mk

TWEAK_NAME = testTweak
testTweak_FILES = Tweak.mm
testTweak_FRAMEWORKS = UIKit
testTweak_PRIVATE_FRAMEWORKS = Nucleus
include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
