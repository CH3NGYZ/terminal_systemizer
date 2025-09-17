# Set to true if you do *NOT* want Magisk to mount
# any files for you. Most modules would NOT want
# to set this flag to true
SKIPMOUNT=false

# Set to true if you need to load system.prop
PROPFILE=false

# Set to true if you need post-fs-data script
POSTFSDATA=false

# Set to true if you need late_start service script
LATESTARTSERVICE=false

print_modname() {
    ui_print "***************************"
    ui_print "  Terminal App Systemizer"
    ui_print "  by veez21, @CH3NGYZ"
    ui_print "***************************"
}

on_install() {
    ui_print "- Extracting system/bin/systemize..."
    unzip -o "$ZIPFILE" 'system/bin/systemize' -d $MODPATH >&2
    ui_print "- Extracting utils/aapt..."
    unzip -o "$ZIPFILE" 'utils/aapt' -d $MODPATH >&2
    ui_print "- Extracting utils/mod-util.sh..."
    unzip -o "$ZIPFILE" 'utils/mod-util.sh' -d $MODPATH >&2
}

set_permissions() {
    set_perm_recursive $MODPATH 0 0 0755 0644
    set_perm $MODPATH/system/bin/systemize 0 0 0777
    set_perm $MODPATH/utils/aapt 0 0 0777
    set_perm $MODPATH/utils/mod-util.sh 0 0 0777
    echo "selinux=${se_value}" >> $MODPATH/module.prop
}