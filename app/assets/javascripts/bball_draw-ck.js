var stroke_color_shot="#444",stroke_color_shot_unhighlighted="#999",stroke_color_shot_highlighted="red",stroke_color_courtitems="#ccc",fill_color_shot="#555",fill_color_shot_missed="none",fill_color_shot_highlighted="red",fill_color_periods="#bbb",fill_opacity=0,radius_shot=9,radius_highlighted_shot=10,stroke_width_shot=3,stroke_width_highlighted_shot=3,opacity_highlighted=.9,opacity_unhighlighted=.2,opacity_default=.7,opacity_zone_default=.3,courtviz=function(e){var t={};this.drawCourt=function(n,r){this.config={div_container:"#chart",svg:{width:500,height:470,"class":"courts",id:n,viewBox:"0 0 500 470"},court_elements:{outline:{width:500,height:470,fill:"none",stroke:"#000","stroke-width":1,"class":"halfcourt"},label:{x:20,y:450,"class":"court_label",fill:"#999"},hoop:{cx:250,cy:47,r:7,stroke:stroke_color_courtitems,fill:"none","stroke-width":3},paint:{x:190,y:0,width:120,height:190,stroke:stroke_color_courtitems,fill:"none","stroke-width":4},paint_circle:{cx:250,cy:190,r:60,stroke:stroke_color_courtitems,fill:"none","stroke-width":4},center_circle:{d:"M310,470 A50,50 0 0,0 190,470",stroke:stroke_color_courtitems,fill:"none","stroke-width":4},backboard:{x:220,y:35,width:60,height:5},threeptstrleft:{d:"M30,0 l0,141",stroke:stroke_color_courtitems,fill:"none","stroke-width":4},threeptstrright:{d:"M470,0 l0,141",stroke:stroke_color_courtitems,fill:"none","stroke-width":4},threeptcurve:{d:"M30,141 A237,237 0 0,0 250,287 A237,237 0 0,0 470,141",stroke:stroke_color_courtitems,fill:"none","stroke-width":4}}};choose_container_selector=typeof e=="undefined"?this.config.div_container:e;svg=d3.select(choose_container_selector).append("svg").attr(this.config.svg);container=svg.append("g").attr("class","court_container");court=container.select("svg.courts");court_label=container.append("text").attr(this.config.court_elements.label).text(r);hoop=container.append("circle").attr(this.config.court_elements.hoop);paint=container.append("rect").attr(this.config.court_elements.paint);paint_circle=container.append("circle").attr(this.config.court_elements.paint_circle);center_circle=container.append("path").attr(this.config.court_elements.center_circle);backboard=container.append("rect").attr(this.config.court_elements.backboard);threeptstrleft=container.append("path").attr(this.config.court_elements.threeptstrleft);threeptstrright=container.append("path").attr(this.config.court_elements.threeptstrright);threeptcurve=container.append("path").attr(this.config.court_elements.threeptcurve);court_outline=container.append("rect").attr(this.config.court_elements.outline);t=svg;return container};this.shrinkCourts=function(){courts=d3.selectAll(".courts");courts.attr({width:500/1.428,height:470/1.428,viewBox:"0 0 500 470"})};this.shrinkCourtsWidthHeight=function(e,t){courts=d3.selectAll(".courts");courts.attr({width:e,height:t,viewBox:"0 0 500 470"})};this.setWidth=function(e){t.attr("width",e)};this.setHeight=function(e){t.attr("height",e)}};