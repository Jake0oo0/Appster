ARCHS = armv7 arm64
TARGET_IPHONEOS_DEPLOYMENT_VERSION = 8.0
THEOS_PACKAGE_DIR_NAME = debs
ADDITIONAL_OBJCFLAGS = -fobjc-arc

include theos/makefiles/common.mk

APPLICATION_NAME = Appster
Appster_FILES = $(wildcard Classes/*.mm) main.m $(wildcard Classes/*.m) $(wildcard Classes/PureLayout/*.m) $(wildcard Classes/MBProgressHud/*.m)
Appster_FRAMEWORKS = UIKit CoreGraphics MessageUI
Appster_PRIVATE_FRAMEWORKS = ChatKit
Appster_LDFLAGS = -lsqlite3 -all_load -ObjC
Appster_LIBRARIES = applist

include $(THEOS_MAKE_PATH)/application.mk

after-install::
	install.exec "killall -9 Appster"
include $(THEOS_MAKE_PATH)/aggregate.mk
