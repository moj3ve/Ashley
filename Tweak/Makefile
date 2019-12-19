ARCHS = arm64 arm64e
TARGET = iphone:clang:13.2:13.2

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Ashley
$(TWEAK_NAME)_FILES = Tweak.xm
$(TWEAK_NAME)_CFLAGS += -fobjc-arc
$(TWEAK_NAME)_FRAMEWORKS += UIKit AudioToolbox
$(TWEAK_NAME)_EXTRA_FRAMEWORKS += Cephei

include $(THEOS_MAKE_PATH)/tweak.mk
