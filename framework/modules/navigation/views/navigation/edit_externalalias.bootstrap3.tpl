{*
 * Copyright (c) 2004-2016 OIC Group, Inc.
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

<div class="module navigation edit_externalalias">
	<div class="form_header">
        <div class="info-header">
            <div class="related-actions">
  			    {help text="Get Help with"|gettext|cat:" "|cat:("Editing External Alias Pages"|gettext) module="edit-external-page"}
            </div>
            <h2>{if $section->id}{'Edit Existing'|gettext}{else}{'Create New'|gettext}{/if} {'External Alias'|gettext}</h2>
            <blockquote>{'Below, enter the web address you want this section to link to.'|gettext}</blockquote>
        </div>
	</div>
    {form action=update}
        {control type=hidden name=id value=$section->id}
        {control type=hidden name=rank value=$section->rank}
        {control type=hidden name=alias_type value=1}
        {control type=hidden name=_validate value=1}
        {control type=hidden name=active value=1}
        <div id="configure-tabs" class="">
            <ul class="nav nav-tabs" role="tablist">
                <li role="presentation" class="active"><a href="#tab1" role="tab" data-toggle="tab"><em>{'Page'|gettext}</em></a></li>
            </ul>
            <div class="tab-content">
                <div id="tab1" role="tabpanel" class="tab-pane fade in active">
                    {control type=text name=name label="Name"|gettext value=$section->name focus=1}
                    {control type=text name=sef_name label="SEF Name"|gettext value=$section->sef_name description='If you don\'t put in an SEF Name one will be generated based on the title provided. SEF names can only contain alpha-numeric characters, hyphens and underscores.'|gettext}
                    {if $section->id == 0}
                        {control type=hidden name=parent value=$section->parent}
                    {else}
                        {control type=dropdown name=parent label="Parent Page"|gettext items=section::levelDropdownControlArray(0,0,array($section->id),($user->isAdmin() || $section->parent == 0),'manage') value=$section->parent}
                    {/if}
                    {control type="checkbox" name="new_window" label="Open in New Window"|gettext|cat:"?" checked=$section->new_window value=1 description='Should menu links for this page open in a new window/tab?'|gettext}
                    {*{control type=text name=external_link label="Page URL"|gettext value=$section->external_link description='Enter the URL to associate with this menu link'|gettext}*}
                    {control type=url name=external_link label="Page URL"|gettext value=$section->external_link description='Enter the URL to associate with this menu link'|gettext}
                    {control type="checkbox" name="public" label="Public"|gettext|cat:"?" checked=$section->public|default:1 value=1 description='Should this page and menu item be visible to all users regardless of permissions?'|gettext}
                    {control type="files" name="files" label="Icon"|gettext accept="image/*" value=$section->expFile limit=1 description='Select an icon to use for this menu item'|gettext}
                </div>
            </div>
        </div>
        {*<div class="loadingdiv">{'Loading Pages'|gettext}</div>*}
        {loading title='Loading Pages'|gettext}
        {control type=buttongroup submit="Save"|gettext cancel="Cancel"|gettext}
    {/form}
</div>

{script unique="tabload" jquery=1 bootstrap="tab,transition"}
{literal}
    $('.loadingdiv').remove();
{/literal}
{/script}