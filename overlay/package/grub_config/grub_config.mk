################################################################################
#
# grub_config
#
################################################################################

GRUB_CONFIG_VERSION =
GRUB_CONFIG_SOURCE =
GRUB_CONFIG_SITE =
GRUB_CONFIG_DEPENDENCIES = 

define GRUB_CONFIG_INSTALL_TARGET_CMDS
    $(INSTALL) -d -m 0755 $(TARGET_DIR)/boot
    $(INSTALL) -d -m 0755 $(TARGET_DIR)/boot/grub
    $(INSTALL) -D -m 0644 $(GRUB_CONFIG_PKGDIR)/grub.cfg $(TARGET_DIR)/boot/grub
endef

$(eval $(generic-package))
