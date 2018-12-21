<select name="user_id" id="user_id" class="select_middle" tabindex="10">
    <option value="0">Chọn nhân viên</option>
    {section name=qi loop=$obj_list}
        <option value="{$obj_list[qi]->user_id}" {if $obj_list[qi]->user_id eq $obj_info.user_id}selected="selected"{/if}>-&nbsp;{$obj_list[qi]->user_fullname}</option>
    {/section}
</select>