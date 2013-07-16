#############################################################
#
# ATMEL QT Home Automation Demo
#
#############################################################

ATMEL_VERSION = 1.2
ATMEL_SOURCE = home-automation-$(ATMEL_VERSION).tar.gz
ATMEL_SITE_METHOD = file

ATMEL_DEPENDENCIES = qt libv4l

define ATMEL_CONFIGURE_CMDS
	cd $(@D) && $(QT_QMAKE)		
endef

define ATMEL_BUILD_CMDS
	 cd $(@D) && $(MAKE)
endef

define ATMEL_INSTALL_TARGET_CMDS
	echo "make install"
	cd $(@D) && $(MAKE) INSTALL_ROOT=$(TARGET_DIR) install
endef

$(eval $(generic-package))
