$('#checkAllPermission').click(function(){
    if($(this).is(':checked')){
        // checked all the checkbox
        $('input[type=checkbox]').prop('checked',true);
    }else{
        // unchecked all the checkbox
        $('input[type=checkbox]').prop('checked',false);
    }
});

function chekPermissionsByGroup(className , checkthis){
    const groupIdName =$('#'+checkthis.id);
    const classCheckBox = $('.'+className+' input');
    if(groupIdName.is(':checked')){
        // checked all the checkbox
        classCheckBox.prop('checked',true);
    }else{
        // unchecked all the checkbox
        classCheckBox.prop('checked',false);
    }

    implementAllChecked();
}


function checkSinglePermission(groumClassName , groupID, countPermssion){
    const groupIdBox =$('#'+groupID);
    const classCheckBox = $('.'+groumClassName+' input');
    // if there is any permission is missing then make group checked false
    if($('.'+groumClassName+' input:checked').length >= countPermssion){
        // checked the group checkbox
        groupIdBox.prop('checked',true);
    }else{
        // unchecked the group checkbox
        groupIdBox.prop('checked',false);
    }

    implementAllChecked();
}

function implementAllChecked(){
    const countPermission ={{ count($allpermissions) }};
    const countPermissionGroup ={{ count($permission_groups) }};

    // if there is any permission is missing then make group checked false
    if($('input[type="checkbox"]:checked').length >= (countPermission+countPermissionGroup)){
        // checked the all checkbox
        $('#checkAllPermission').prop('checked',true);
    }else{
        // unchecked the all checkbox
        $('#checkAllPermission').prop('checked',false);
    }
}
