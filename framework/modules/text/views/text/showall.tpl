{*
 * Copyright (c) 2004-2014 OIC Group, Inc.
 *
 * This file is part of Exponent
 *
 * Exponent is free software; you can redistribute
 * it and/or modify it under the terms of the GNU
 * General Public License as published by the Free
 * Software Foundation; either version 2 of the
 * License, or (at your option) any later version.
 *
 * GPL: http://www.gnu.org/licenses/gpl.txt
 *
 *}

<div class="module text showall">
    {if $moduletitle && !($config.hidemoduletitle xor $smarty.const.INVERT_HIDE_TITLE)}<{$config.heading_level|default:'h1'}>{$moduletitle}</{$config.heading_level|default:'h1'}>{/if}
    {permissions}
        <div class="module-actions">
            {if $permissions.create}
                {icon class=add action=edit rank=1 text="Add text at the top"|gettext}
            {/if}
            {if $permissions.manage}
                {ddrerank items=$items model="text" label="Text Items"|gettext}
            {/if}
        </div>
    {/permissions}
    {if $config.moduledescription != ""}
        {$config.moduledescription}
    {/if}
    {$myloc=serialize($__loc)}
    {foreach from=$items item=text name=items}
        <div class="item{if !$text->approved && $smarty.const.ENABLE_WORKFLOW} unapproved{/if}">
            {if $text->title}<{$config.item_level|default:'h2'}>{$text->title}</{$config.item_level|default:'h2'}>{/if}
            {permissions}
                <div class="item-actions">
                    {if $permissions.edit || ($permissions.create && $text->poster == $user->id)}
                        {if $text->revision_id > 1}<span class="revisionnum approval" title="{'Viewing Revision #'|gettext}{$text->revision_id}">{$text->revision_id}</span>{/if}
                        {if $myloc != $text->location_data}
                            {if $permissions.manage}
                                {icon action=merge id=$text->id title="Merge Aggregated Content"|gettext}
                            {else}
                                {icon img='arrow_merge.png' title="Merged Content"|gettext}
                            {/if}
                        {/if}
                        {icon action=edit record=$text}
                    {/if}
                    {if $permissions.delete || ($permissions.create && $text->poster == $user->id)}
                        {icon action=delete record=$text}
                    {/if}
                    {if !$text->approved && $smarty.const.ENABLE_WORKFLOW && $permissions.approve && $permissions.edit}
                        {icon action=approve record=$text}
                    {/if}
                </div>
            {/permissions}
            <div class="bodycopy">
                {if $config.ffloat != "Below"}
                    {filedisplayer view="`$config.filedisplay`" files=$text->expFile record=$text}
                {/if}
                {$text->body}
                {if $config.ffloat == "Below"}
                    {filedisplayer view="`$config.filedisplay`" files=$text->expFile record=$text}
                {/if}
            </div>
        </div>
        {clear}
        {permissions}
			<div class="module-actions">
				{if $permissions.create}
					{icon class=add action=edit rank=$text->rank+1 text="Add more text here"|gettext}
				{/if}
			</div>
        {/permissions}
    {/foreach}
</div>
