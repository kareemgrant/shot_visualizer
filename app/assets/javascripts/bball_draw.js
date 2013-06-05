var stroke_color_shot = '#444';
var stroke_color_shot_unhighlighted = '#999';
var stroke_color_shot_highlighted = 'red';
var stroke_color_courtitems = '#ccc';
var fill_color_shot = '#555';
var fill_color_shot_missed = 'none';
var fill_color_shot_highlighted = 'red';
var fill_color_periods = '#bbb';
var fill_opacity = 0;

var radius_shot = 9;
var radius_highlighted_shot = 10;
var stroke_width_shot = 3;
var stroke_width_highlighted_shot = 3;

var opacity_highlighted = 0.9;
var opacity_unhighlighted = 0.2;
var opacity_default = 0.7;	
var opacity_zone_default = 0.3;


var courtviz = function(container_selector) {

    var court_svg = {};

    this.drawCourt = function(court_id, court_label_text) {
        this.config = {
            'div_container':'#chart',
            'svg':{
                'width':500,
                'height':470,
                'class':'courts',
                'id':court_id,
                'viewBox':"0 0 500 470",
            },
            'court_elements':{
                'outline': {
                    'width': 500,
                    'height':470,
                    'fill':'none',
                    'stroke':'#000',
                    'stroke-width':1,
                    'class':'halfcourt'
                },
                'label':{
                    'x':20,
                    'y':450,
                    'class':'court_label',
                    'fill':'#999'
                },
                'hoop':{'cx':250,'cy':47,'r':7,'stroke':stroke_color_courtitems,'fill':'none','stroke-width':3},
                'paint':{'x':190,'y':0,'width':120,'height':190,'stroke':stroke_color_courtitems,'fill':'none','stroke-width':4},
                'paint_circle':{'cx':250,'cy':190,'r':60,'stroke':stroke_color_courtitems,'fill':'none','stroke-width':4},
                'center_circle':{'d':'M310,470 A50,50 0 0,0 190,470','stroke':stroke_color_courtitems,'fill':'none','stroke-width':4},
                'backboard':{'x':220,'y':35,'width':60,'height':5},

                'threeptstrleft':{'d':'M30,0 l0,141','stroke':stroke_color_courtitems,'fill':'none','stroke-width':4},
                'threeptstrright':{'d':'M470,0 l0,141','stroke':stroke_color_courtitems,'fill':'none','stroke-width':4},

                'threeptcurve':{'d':'M30,141 A237,237 0 0,0 250,287 A237,237 0 0,0 470,141','stroke':stroke_color_courtitems,'fill':'none','stroke-width':4},
            }
        }

        choose_container_selector = typeof container_selector === 'undefined' ? this.config.div_container : container_selector;

        svg                 = d3.select(choose_container_selector).append("svg")
                                .attr(this.config.svg);

        container           = svg.append("g").attr("class","court_container");
        court               = container.select("svg.courts");
        court_label         = container.append("text")
                                .attr(this.config.court_elements.label)
                                .text(court_label_text);
        hoop                = container.append("circle")
                                .attr(this.config.court_elements.hoop);
        paint               = container.append("rect")
                                .attr(this.config.court_elements.paint);
        paint_circle        = container.append("circle")
                                .attr(this.config.court_elements.paint_circle);
        center_circle       = container.append("path")
                                .attr(this.config.court_elements.center_circle);
        backboard           = container.append("rect")
                                .attr(this.config.court_elements.backboard);
        threeptstrleft      = container.append("path")
                                .attr(this.config.court_elements.threeptstrleft);
        threeptstrright     = container.append("path")
                                .attr(this.config.court_elements.threeptstrright);
        threeptcurve        = container.append("path")
                                .attr(this.config.court_elements.threeptcurve);
        court_outline       = container.append("rect")
                                .attr(this.config.court_elements.outline);

        court_svg = svg;
        return container;
    }


    // The following methods aren't needed for main chart
    this.shrinkCourts = function() {
        courts = d3.selectAll(".courts");
        courts.attr({"width":500/1.428,"height":470/1.428,"viewBox":"0 0 500 470"});
    }


    this.shrinkCourtsWidthHeight = function(width, height) {
        courts = d3.selectAll(".courts");
        courts.attr({"width":width,"height":height,"viewBox":"0 0 500 470"});
    }

    this.setWidth = function(width) {
        court_svg.attr("width",width);
    }
    this.setHeight = function(height) {
        court_svg.attr("height",height);
    }
}


