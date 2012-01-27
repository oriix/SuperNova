<br />

<script type="text/javascript"><!--
var production = Array();
var unit_selected = null;
var eco_bld_style_probe;

language = 
{
  eco_que_empty: '{L_eco_que_empty}',
  level: '{L_level}',
  level_short: '{L_sys_level_short}',
  bld_create: '{L_bld_create}',
  bld_destroy: '{L_bld_destroy}',
  construction_time: '{L_ConstructionTime}',
  eco_price: '{L_eco_price}',
  eco_left: '{L_eco_left}',
  eco_left_fleet: '{L_eco_left_fleet}',

  sys_resources: '{L_sys_resources}',
  sys_metal: '{L_sys_metal}',
  sys_crystal: '{L_sys_crystal}',
  sys_deuterium: '{L_sys_deuterium}',
  sys_energy: '{L_sys_energy}'
};

planet =
{
  fleet_own: '{FLEET_OWN}',

  metal: '{METAL}',
  crystal: '{CRYSTAL}',
  deuterium: '{DEUTERIUM}',

  metal_incoming: '{METAL_INCOMING}',
  crystal_incoming: '{CRYSTAL_INCOMING}',
  deuterium_incoming: '{DEUTERIUM_INCOMING}',

  que_has_place: '{QUE_HAS_PLACE}',
  que_has_fields: '{QUE_HAS_FIELDS}',
  fields_free: '{FIELDS_FREE}'
};

var que_id = '{QUE_ID}';
--></script>

<script language="JavaScript" type="text/javascript" src="js/build_unit.js"></script>

<!-- DEFINE $QUE_ID = '{QUE_ID}' -->
<!-- INCLUDE eco_queue.tpl -->
<!-- IF U_opt_int_struc_vertical && $QUE_NOT_EMPTY -->
  <!-- DEFINE $COLSPAN = 6 -->
<!-- ELSE -->
  <!-- DEFINE $COLSPAN = 5 -->
<!-- ENDIF -->

<table width="650px" id="unit_table">
  <tr>
    <td colspan="{$COLSPAN}" class="c" align="center">
      {L_bld_theyare} {L_bld_cellfree} {FIELDS_FREE} (<!-- IF FIELDS_QUE != 0 --><span style="color: yellow;">{FIELDS_QUE}</span>/<!-- ENDIF --><span class="negative">{FIELDS_CURRENT}</span>/<span class="positive">{FIELDS_MAX}</span>)
    </td>
  </tr>

    <!-- IF ! U_opt_int_struc_vertical && $QUE_NOT_EMPTY -->
    <tr>
      <td colspan="5" class="c_c" align="center">
<!-- INCLUDE eco_bld_queue_list.tpl -->
      </td>
    </tr>
    <!-- ENDIF -->

  <!-- IF METAL > 99999999999 || CRYSTAL > 9999999999 || DEUTERIUM > 9999999999 || METAL < -9999999999 || CRYSTAL < -999999999 || DEUTERIUM < -999999999-->
    <!-- DEFINE $FONT_SIZE = '80%' -->
  <!-- ELSE -->
    <!-- DEFINE $FONT_SIZE = '100%' -->
  <!-- ENDIF -->

  <tr>
    <td colspan="5" id="unit_info" style="vertical-align: top;">
      <table cellspacing=0 cellpadding=0 valign=top style="vertical-align: top; border: 0;" class="noborder" width=100%>
        <tr>
          <th width=120px valign=top>
            <div id="unit_name"></div>
          </th>
          <th colspan=3 valign=top>
            <div id="unit_description" style="text-align: justify; height: 8ex;"></div>
          </th>
        </tr>

        <tr>
          <th>
            <div style="height: 140px; vertical-align: middle"><img id="unit_image" border="0" src="" align="top"></div>
          </th>

          <th valign=top width="50%">
            <div id="unit_create_link"></div>
            <div>{L_ConstructionTime}<span id="unit_time"></span></div>
            <table style="margin: 0px;">
              <tr>
                <td class=c style="font-size: {$FONT_SIZE}" width=45>{L_sys_resources}</td>
                <td class=c style="font-size: {$FONT_SIZE}" width=65>{L_eco_price}</td>
                <td class=c style="font-size: {$FONT_SIZE}" width=65>{L_eco_left}</td>
                <td class=c style="font-size: {$FONT_SIZE}" width=65 hide_no_fleet="yes">{L_eco_left_fleet}</td>
              </tr>
              <tr id="unit_metal">
                <td style="font-size: {$FONT_SIZE}">{L_sys_metal}</td>
                <td style="font-size: {$FONT_SIZE}" id="metal_price" align="right">0</td>
                <td style="font-size: {$FONT_SIZE}" id="metal_left" align="right">0</td>
                <td style="font-size: {$FONT_SIZE}" id="metal_fleet" hide_no_fleet="yes" align="right">0</td>
              </tr>
              <tr id="unit_crystal">
                <td style="font-size: {$FONT_SIZE}">{L_sys_crystal}</td>
                <td style="font-size: {$FONT_SIZE}" id="crystal_price" align="right">0</td>
                <td style="font-size: {$FONT_SIZE}" id="crystal_left" align="right">0</td>
                <td style="font-size: {$FONT_SIZE}" id="crystal_fleet" hide_no_fleet="yes" align="right">0</td>
              </tr>
              <tr id="unit_deuterium">
                <td style="font-size: {$FONT_SIZE}">{L_sys_deuterium}</td>
                <td style="font-size: {$FONT_SIZE}" id="deuterium_price" align="right">0</td>
                <td style="font-size: {$FONT_SIZE}" id="deuterium_left" align="right">0</td>
                <td style="font-size: {$FONT_SIZE}" id="deuterium_fleet" hide_no_fleet="yes" align="right">0</td>
              </tr>
            </table>
            <div id="unit_destroy_link"></div>
          </th>
          <th width="50%">
            <div id="unit_balance"></div>
          </th>
        </tr>
      </table>
    </td>

    <!-- IF U_opt_int_struc_vertical && $QUE_NOT_EMPTY -->
      <td rowspan="5" class="c_c" align="center" valign="top" width="120px">
<!-- INCLUDE eco_bld_queue_list.tpl -->
      </td>
    <!-- ENDIF -->
  </tr>

  <tr>
    <!-- BEGIN production -->
      <td class="l" align="center" width="20%">
        <div class="unit_preview" style="" id="unit{production.ID}" unit_id="{production.ID}">
          <span style="position: absolute; left: 0px; top: 0px; width: 100%; height: 100%">
            <img border="0" src="{dpath}gebaeude/{production.ID}.gif" align="top" width="100%" height="100%">
          </span>

          <span style="position: absolute; bottom: 2px; right: 18px; width: 70%; font-size: 100%; text-align: left;" class="icon_alpha">
            <div class="fr">{production.TIME}</div>
          </span>

          <!-- IF     (production.METAL && (production.METAL_REST_NUM > 999999999 || production.METAL_REST_NUM < -99999999)) || (production.CRYSTAL && (production.CRYSTAL_REST_NUM > 999999999)) || production.CRYSTAL_REST_NUM < -99999999 || (production.DEUTERIUM && (production.DEUTERIUM_REST_NUM > 999999999  || production.DEUTERIUM_REST_NUM < -99999999)) -->
            <!-- DEFINE $FONT_SIZE = '80%' -->
          <!-- ELSEIF (production.METAL && (production.METAL_REST_NUM > 99999999  || production.METAL_REST_NUM < -9999999 )) || (production.CRYSTAL && (production.CRYSTAL_REST_NUM > 99999999 )) || production.CRYSTAL_REST_NUM < -9999999  || (production.DEUTERIUM && (production.DEUTERIUM_REST_NUM > 99999999   || production.DEUTERIUM_REST_NUM < -9999999 )) -->
            <!-- DEFINE $FONT_SIZE = '90%' -->
          <!-- ELSE -->
            <!-- DEFINE $FONT_SIZE = '100%' -->
          <!-- ENDIF -->
          <span style="position: absolute; top: 48px; left: 0px; width: 100%; text-align: left; font-size: {$FONT_SIZE};" class="icon_alpha"> <!--  onclick="eco_struc_select_unit({production.ID})" onmouseout="eco_struc_unborder_unit({production.ID})" onmouseover="eco_struc_show_unit_info({production.ID})"> -->
            <!-- IF production.METAL --><div><div style="left: 0px; position: absolute;"><!-- IF $FONT_SIZE == '80%' -->{L_sys_metal_sh}<!-- ELSE -->{L_sys_metal}<!-- ENDIF --></div><div class="fr">{production.METAL_REST}</div></div><br><!-- ENDIF -->
            <!-- IF production.CRYSTAL --><div><div style="left: 0px; position: absolute;"><!-- IF $FONT_SIZE == '80%' -->{L_sys_crystal_sh}<!-- ELSE -->{L_sys_crystal}<!-- ENDIF --></div><div class="fr">{production.CRYSTAL_REST}</div></div><br><!-- ENDIF -->
            <!-- IF production.DEUTERIUM --><div><div style="left: 0px; position: absolute;"><!-- IF $FONT_SIZE == '80%' -->{L_sys_deuterium_sh}<!-- ELSE -->{L_sys_deuterium}<!-- ENDIF --></div><div class="fr">{production.DEUTERIUM_REST}</div></div><!-- ENDIF -->
          </span>

          <!-- IF QUE_HAS_PLACE && ! production.UNIT_BUSY -->
            <!-- IF FIELDS_FREE > 0 && production.BUILD_CAN && production.BUILD_RESULT == 0 -->
              <span style="position: absolute; top: 0px; right: 0px;" class="icon_alpha" onclick="document.location='buildings.php?mode={QUE_ID}&action=create&unit_id={production.ID}'">
                <div class="icons icon-plus"></div>
              </span>
            <!-- ENDIF -->
          <!-- ENDIF -->

          <!-- IF production.BUILD_RESULT != 0 -->
            <span style="position: absolute; top: 0px; left: 0px; width: 100%; height: 100%" class="icon_alpha">
              <span style="position: absolute; top: 77px; left: 0px; width: 100%; height: 20%" >{production.BUILD_RESULT_TEXT}</span>
            </span>
          <!-- ENDIF -->


          <span style="position: absolute; top: 18px; left: 0px; width: 100%; height: 5ex; font-size: 100%;" class="icon_alpha"> 
            {production.NAME}
          </span>

          <span style="position: absolute; top: 0; left: 20%; width: 60%; height: 16px; text-align: center; font-size: 120%;" class="icon_alpha">
            <!-- IF production.LEVEL_OLD -->{production.LEVEL_OLD}<!-- ENDIF --><!-- IF production.LEVEL_CHANGE --><!-- IF production.LEVEL_CHANGE > 0 -->+<!-- ENDIF -->{production.LEVEL_CHANGE}<!-- ENDIF -->
          </span>

          <!-- IF QUE_HAS_PLACE && ! production.UNIT_BUSY -->
            <!-- IF production.LEVEL && production.DESTROY_CAN && production.DESTROY_RESULT == 0 -->
              <span style="position: absolute; top: 0px; left: 0px;" class="icon_alpha" onclick="document.location='buildings.php?mode={QUE_ID}&action=destroy&unit_id={production.ID}'">
                <div class="icons icon-minus" title="{L_bld_destroy}: {L_sys_metal} {production.DESTROY_METAL}; {L_sys_crystal} {production.DESTROY_CRYSTAL}; {L_sys_deuterium} {production.DESTROY_DEUTERIUM}; {L_sys_time} {production.DESTROY_TIME}"></div>
              </span>
            <!-- ENDIF -->
          <!-- ENDIF -->

          <span style="position: absolute; bottom: 0; right: 0; cursor: pointer;" title="{L_flt_gather_all}" class="icon_alpha" onclick="document.location='fleet.php?fleet_page=5&cp={planet.ID}&re=0&metal={production.METAL_REST_NUM}&crystal={production.CRYSTAL_REST_NUM}&deuterium={production.DEUTERIUM_REST_NUM}'">
            <div class="icons icon-gather"></div>
          </span>

          <span style="position: absolute; bottom: 0px; left: 0px;" class="icon_alpha" onclick="document.location='infos.php?gid={production.ID}'">
            <div class="icons icon-info"></div>
          </span>

        </div>
      </td>

      <!-- IF (production.S_ROW_COUNT + 1) mod 5 == 0 -->
        </tr><tr>
      <!-- ENDIF -->

      <script type="text/javascript"><!--
      production[{production.ID}] = 
      {
        id: '{production.ID}',
        name: '{production.NAME}',
        level: '{production.LEVEL}',
        change: '{production.CHANGE}',
        description: '{production.DESCRIPTION}', 
        unit_busy: '{production.UNIT_BUSY}',
        
        metal: '{production.METAL}',
        crystal: '{production.CRYSTAL}',
        deuterium: '{production.DEUTERIUM}',
        time: '{production.TIME}',
        build_can: '{production.BUILD_CAN}',
        build_result: '{production.BUILD_RESULT}',

        destroy_metal: '{production.DESTROY_METAL}',
        destroy_crystal: '{production.DESTROY_CRYSTAL}',
        destroy_deuterium: '{production.DESTROY_DEUTERIUM}',
        destroy_time: '{production.DESTROY_TIME}',
        destroy_can: '{production.DESTROY_CAN}',
        destroy_result: '{production.DESTROY_RESULT}',

        <!-- IF .production.resource -->
          resource_map: [
          <!-- BEGIN resource -->
            {
              level: '{resource.LEVEL}',
              metal: '{resource.METAL}',
              metal_diff: '{resource.METAL_DIFF}',
              'crystal': '{resource.CRYSTAL}',
              'crystal_diff': '{resource.CRYSTAL_DIFF}',
              'deuterium': '{resource.DEUTERIUM}',
              'deuterium_diff': '{resource.DEUTERIUM_DIFF}',
              'energy': '{resource.ENERGY}',
              'energy_diff': '{resource.ENERGY_DIFF}'
            },
          <!-- END resource -->
          ]
        <!-- ENDIF -->
      };
      --></script>
    <!-- END production -->
  </tr>
</table>
<div id="style_probe"></div>

<!-- INCLUDE page_hint.tpl -->

<script type="text/javascript"><!--
jQuery(document).ready(
  function()
  {
    jQuery("#unit_table").delegate("*[unit_id]", "mouseenter",
      function(event, ui)
      {
        eco_struc_show_unit_info(jQuery(this).attr('unit_id'));
      }
    );

    jQuery("#unit_table").delegate("*[unit_id]", "mouseleave",
      function(event, ui)
      {
        eco_struc_unborder_unit(jQuery(this).attr('unit_id'));
      }
    );

    jQuery("#unit_table").delegate("*[unit_id]", "click",
      function(event, ui)
      {
        eco_struc_select_unit(jQuery(this).attr('unit_id'));
      }
    );

    if(!planet['fleet_own'])
    {
      jQuery("[hide_no_fleet]").hide();
    }

    eco_bld_style_probe = sn_probe_style(element_cache['style_probe'], 'border-top-color');

    for(production_id in production)
    {
      eco_struc_show_unit_info(production_id, true);
      // break;
    }

    for(production_id in production)
    {
      eco_struc_show_unit_info(production_id, true);
      break;
    }
  }
);
--></script>
