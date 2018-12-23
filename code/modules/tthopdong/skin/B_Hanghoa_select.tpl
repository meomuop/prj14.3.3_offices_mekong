<select name="hanghoa_id" id="hanghoa_id" class="select_long" tabindex="10">
    {section name=qi loop=$obj_list}
        <option value="{$obj_list[qi]->hanghoa_id}" {if $obj_list[qi]->hanghoa_id eq $obj_info.hanghoa_id}selected="selected"{/if}>{$obj_list[qi]->hanghoa_name}</option>
    {/section}
</select>