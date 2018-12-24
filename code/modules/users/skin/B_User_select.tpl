<select name="user_id" id="user_id" class="select_middle" tabindex="10">
    {section name=qi loop=$obj_list}
        <option value="{$obj_list[qi]->user_id}" {if $obj_list[qi]->user_id eq $obj_info.user_id}selected="selected"{/if}>{$obj_list[qi]->user_fullname}</option>
    {/section}
</select>