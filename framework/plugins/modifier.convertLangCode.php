<?php

##################################################
#
# Copyright (c) 2004-2011 OIC Group, Inc.
# Written and Designed by James Hunt
#
# This file is part of Exponent
#
# Exponent is free software; you can redistribute
# it and/or modify it under the terms of the GNU
# General Public License as published by the Free
# Software Foundation; either version 2 of the
# License, or (at your option) any later version.
#
# GPL: http://www.gnu.org/licenses/gpl.txt
#
##################################################

function smarty_modifier_convertlangcode($lang_code, $target = "iso639-1") {
	return $lang_code; // this plugin isn't used, but this will at least return something
//	return exponent_lang_convertLangCode($lang_code, $target);
}

?>