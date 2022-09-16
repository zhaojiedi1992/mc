// 获取等级

// Lv.1 

// 获取当前等级 1 

// 获取下一个等级 2

// 获取下一个等级组大名字
// 获取下一个等级组的小明子

function is_vip_user(group_name){
    var vip_list = ['Owner', 'OP', 'SVIP', 'VIP'];
    return  vip_list.includes(group_name);
}

function get_level(group_name){
    group_infos = group_name.split(".");
    group_infoss_length = group_infos.length ;
    return group_infos[group_infoss_length-1]
}



get_level("Lv.0")
