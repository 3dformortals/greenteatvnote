package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.ui.FlxButton;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class FullState extends FlxState {
    
    var a_guifonstatic:Array<FlxSprite>=new Array(); // для картинок под кнопками и возможно яркости
    var a_guifonlike:Array<FlxSprite>=new Array(); // для картинок под кнопками и возможно яркости like block
    var a_guisymstatic:Array<FlxSprite>=new Array(); //надписи на фонах
    var a_guisymlike:Array<FlxSprite>=new Array(); //надписи на фонах
    var a_guibtnstatic:Array<FlxButton>=new Array(); //надписи на фонах
    var a_guibtnlike:Array<FlxButton>=new Array(); //надписи на фонах
    var llll:FlxSprite;
    var help:FlxSprite;
    var page:Int=1;
    var maxpage:Int=1;
    
    
    function guifon_maker():Void{
        // static gui block
        var ax:Array<Int>=new Array(); //координаты спрайтов
        var ay:Array<Int>=new Array(); //координаты спрайтов
        var aa:Array<String>=new Array();
        aa.push("assets/images/r8080.png");
        aa.push("assets/images/b8080.png");
        aa.push("assets/images/b8080.png");
        aa.push("assets/images/b8080.png");
        aa.push("assets/images/b8080.png");
        aa.push("assets/images/b8080.png");
        aa.push("assets/images/r8080.png");
        aa.push("assets/images/b80160.png");//down bar
        aa.push("assets/images/b80160.png");
        aa.push("assets/images/b160160.png");
        aa.push("assets/images/b160160.png");
        var d:Int = 80;
        ax=[d*0,d*1,d*2,d*3,d*4,d*5,d*8,d*0,d*4,d*5,d*7];
        ay=[d*2,d*2,d*2,d*2,d*2,d*2,d*2,d*14,d*14,d*14,d*14];
        for (i in 0...11){
            a_guifonstatic.push(new FlxSprite(ax[i],ay[i],aa[i]));
            add(a_guifonstatic[i]);
        }
        // like gui block rowleft then row right
        ax=[d*0,d*0,d*0,d*0,d*0,d*0,d*0,d*0,d*0,d*0,d*8,d*8,d*8,d*8,d*8,d*8,d*8,d*8,d*8,d*8];
        ay=[for (i in 4...14) d*i].concat([for (i in 4...14) d*i]);
        aa=[for (i in 0...10) "assets/images/b8080.png"];
        aa=aa.concat([for (i in 0...10) "assets/images/r8080.png"]);
        for (i in 0...20){
            a_guifonlike.push(new FlxSprite(ax[i],ay[i],aa[i]));
            add(a_guifonlike[i]);
        }
    }
    
    function guisym_maker():Void{
        // static gui block
        var ax:Array<Int>=new Array(); //координаты спрайтов
        var ay:Array<Int>=new Array(); //координаты спрайтов
        var aa:Array<String>=new Array();
        aa.push("assets/images/help8080.png");
        aa.push("assets/images/20sun8080.png");
        aa.push("assets/images/40sun8080.png");
        aa.push("assets/images/60sun8080.png");
        aa.push("assets/images/80sun8080.png");
        aa.push("assets/images/100sun8080.png");
        aa.push("assets/images/gt8080.png");
        aa.push("assets/images/page80160.png");//down bar first need mirror 
        aa.push("assets/images/page80160.png");
        aa.push("assets/images/like160160.png");
        aa.push("assets/images/new160160.png");
        var d:Int = 80;
        ax=[d*0,d*1,d*2,d*3,d*4,d*5,d*8,d*0,d*4,d*5,d*7];
        ay=[d*2,d*2,d*2,d*2,d*2,d*2,d*2,d*14,d*14,d*14,d*14];
        for (i in 0...11){
            a_guisymstatic.push(new FlxSprite(ax[i],ay[i],aa[i]));
            add(a_guisymstatic[i]);
        }
        a_guisymstatic[7].flipX=true;
        // like gui block rowleft then row right
        ax=[d*0,d*0,d*0,d*0,d*0,d*0,d*0,d*0,d*0,d*0,d*8,d*8,d*8,d*8,d*8,d*8,d*8,d*8,d*8,d*8];
        ay=[for (i in 4...14) d*i].concat([for (i in 4...14) d*i]);
        aa=[for (i in 0...10) "assets/images/like8080.png"];
        aa=aa.concat([for (i in 0...10) "assets/images/gt8080.png"]);
        for (i in 0...20){
            a_guisymlike.push(new FlxSprite(ax[i],ay[i],aa[i]));
            add(a_guisymlike[i]);
        }
        llll=new FlxSprite(d*6,d*2); // llll google play
        llll.loadGraphic("assets/images/ani_llll.png",true,160,80);
        llll.animation.add("tik",[0,1,2,3,2,1,0,4,5,6,5,4],12,true);
        llll.animation.play("tik");
        add(llll);
    }
    
    function btn_llllcallback():Void
    {
        Main.refreshwww();
    }
    
    // btn callback blok
    
    function maxpage_counter():Void{
        maxpage=Std.int(Math.fceil(Main.fullhref.length/10));
        if (maxpage==0){page=1;}
        else if (page>maxpage) {page=maxpage;}
    }
    
    function refresh_screen_text():Void{
        var xname:Array<String>=Main.fullname; //название
        var xok:Array<Int>=Main.fullok; //выпущеные серии
        var xhref:Array<String>=Main.fullhref; //сылки
        var xlikehref:Array<String>=Main.likehref;//сылки избраное
        var xlikedone:Array<Int>=Main.likedone; //просмотреные в избраном
        var fresh:String="";//сколько новых серий для просмотра
        var x:Int=-1;//индекс совпавшего сериала в избраном
        
        if (maxpage==0){ a_text[1].text="список пустой. сначала обновите даные"; }
        var j:Int=10*(page-1);
        for (i in 1...11){ //индексы текстовых полей на экране в масиве
            if(i+j-1 < Main.fullhref.length){
                a_text[i].text=Std.string(xname[i+j-1]).substr(0,90)+"..."; //названия 62 на ощупь... форматирование убитое split join бредятину какую то показывают
                x=href_in_like(xhref[i+j-1],xlikehref);
                if (x>-1){fresh=Std.string(xok[i+j-1]-xlikedone[x]);}else{fresh=Std.string(xok[i+j-1]);}
                a_text[i+10].text=fresh; //пока выпущеные только... потом не просмотреные сделать
            }else{
                a_text[i].text="";
                a_text[i+10].text="";
            }
        }
        a_text[21].text=Std.string(page)+"/"+Std.string(maxpage);
    }
    
    function refresh_screen_sym():Void{
        var xhref:Array<String>=Main.fullhref;
        var xlikehref:Array<String>=Main.likehref;
        var x:Int=10*(page-1);
        for (i in 0...10){ //индексы символов кнопок на экране в масиве
            if(href_in_like(xhref[i+x],xlikehref)>-1){
                a_guisymlike[i].color=FlxColor.WHITE;
            }else{
                a_guisymlike[i].color=FlxColor.BLACK;
            }
            if (i+x < Main.fullhref.length){
                a_guisymlike[i+10].color=FlxColor.WHITE;
            }else{a_guisymlike[i+10].color=FlxColor.BLACK;}
        }
    }
    
    function refresh_screen_fon():Void{
        var x:Int=10*(page-1);
        for (i in 0...10){ //индексы фонов кнопок на экране в масиве
            if(i+x < Main.fullhref.length){
                a_guifonlike[i].color=FlxColor.WHITE;
                a_guifonlike[i+10].color=FlxColor.WHITE;
            }else{
                a_guifonlike[i].color=FlxColor.BLACK;
                a_guifonlike[i+10].color=FlxColor.BLACK;
            }
        }
    }
    
    function refresh_screen_btn():Void{
        var x:Int=10*(page-1);
        for (i in 0...10){ //индексы кнопок на экране в масиве
            if(i+x < Main.fullhref.length){
                a_guibtnlike[i].color=FlxColor.WHITE;
                a_guibtnlike[i+10].color=FlxColor.WHITE;
                a_guibtnlike[i+20].color=FlxColor.WHITE;
            }else{
                a_guibtnlike[i].color=FlxColor.BLACK;
                a_guibtnlike[i+10].color=FlxColor.BLACK;
                a_guibtnlike[i+20].color=FlxColor.BLACK;
            }
        }
    }
    
    function refresh_screen():Void{
        maxpage_counter();
        refresh_screen_text();
        refresh_screen_sym();
        refresh_screen_fon();
        refresh_screen_btn();
    }
    
    function new_btn_callback():Void{
        var situation:String=Main.refresh_web_data_maker("full");
        if(situation=="ok"){
            a_text[0].text="получены новые даные о релизах";
            Main.saveall();
        }else if (situation=="pause"){
            a_text[0].text="рано. бережем трафик сайта. пауза 1/4 часа.";
        }else if (situation=="error"){
            a_text[0].text="ошибка даных. проверьте доступность сайта.";
        }else{
            a_text[0].text="неизвестная ошибка. сообщите разработчикам.";
        }
        refresh_screen();
    }
    
    function help_btn_callback():Void{
        if(help.visible){help.visible=false;help.kill();}
        else{help.visible=true;add(help);help.reset(0,160);}
    }
    
    function pageminus_btn_callback():Void{
        if (page>1) {page-=1;}else{page=maxpage;}
        refresh_screen();
    }
    
    function pageplus_btn_callback():Void{
        if (page<maxpage) {page+=1;}else{page=1;}
        refresh_screen();
    }
    
    function is_add_to_like_btn(name:String):Int{
        var names:Array<String>=[for (i in 1...11) "like"+Std.string(i)];
        for (i in 0...10){
            if (name==names[i]){return i;}
        }
        return -1;
    }
    
    /**
     *  if fullhref inside xlikehref return index of xlikehref element else return -1
     *  @param fullhref - String (href)
     *  @param xlikehref - Array<String> (of hrefs)
     *  @return Int
     */
    function href_in_like(fullhref:String,xlikehref:Array<String>):Int{
        for (i in 0...xlikehref.length){
            if (fullhref == xlikehref[i]){return i;}
        }
        return -1;
    }
    
    function like_btn_callback(n:Int):Void{
        var x:Int=10*(page-1);
        var fullhref:String=Main.fullhref[n+x];
        if (href_in_like(fullhref,Main.likehref)==-1){//нет в избраном
            Main.likehref.push(fullhref);
            Main.likename.push(Main.fullname[n+x]);
            Main.likeok.push(Main.fullok[n+x]);
            Main.likedone.push(0);
            refresh_screen_sym();
            a_text[0].text="добавлено в избраное";
        }else{a_text[0].text="успокойтесь, дышите глубже";}
        
    }
    
    function is_info_btn(name):Int{
        var names:Array<String>=[for (i in 1...11) "info"+Std.string(i)];
        for (i in 0...10){
            if (name==names[i]){return i;}
        }
        return -1;
    }
    
    function info_btn_callback(n:Int):Void{
        var x:Int=10*(page-1);
        var ok:Int=Main.fullok[n+x];
        var done:Int;
        var hil:Int=href_in_like(Main.fullhref[n+x],Main.likehref);
        if (hil>-1) done=Main.likedone[hil];
        else done=0;
        a_text[0].text="готово: "+ok+"  просмотрено: "+Std.string(done)+"  новых: "+Std.string(ok-done);
    }
    
    function is_gt_btn(name):Int{
        var names:Array<String>=[for (i in 1...11) "gt"+Std.string(i)];
        for (i in 0...10){
            if (name==names[i]){return i;}
        }
        return -1;
    }
    
    function gt_btn_callback(n:Int):Void{
        var x:Int=10*(page-1);
        FlxG.openURL(Main.fullhref[n+x],"_blank");
    }
    
    function is_sun_btn(name:String):Float{
        var names:Array<String>=[for (i in 1...6) Std.string(i*20)+"sun"];
        for (i in 0...5){
            if (name==names[i]){
                Main.sun=(i+1)*20/100;
                return Main.sun;
            }
        }
        return 0;
    }
    
    function sun_btn_callback(alp:Float):Void{
        for (i in a_guifonlike){i.alpha=alp;}
        for (i in a_guifonstatic){i.alpha=alp;}
        for (i in a_guisymstatic){i.alpha=alp;}
        for (i in a_guisymlike){i.alpha=alp;}
        for (i in a_text){i.alpha=alp;}
        llll.alpha=alp;
    }
    
    function guibtn_callback(name:String):Void{
        if (Main.cantouch){
            Main.cantouch=false;
            var is_like:Int=is_add_to_like_btn(name); //>-1 = add to like pressed
            var is_info:Int=is_info_btn(name); //>-1 = info btn number
            var is_gt:Int=is_gt_btn(name); //>-1 = gt btn number
            var is_sun:Float=is_sun_btn(name); //alpha for sprites
            if (name=="new") new_btn_callback();
            else if (name=="page<") pageminus_btn_callback();
            else if (name=="page>") pageplus_btn_callback();
            else if (is_like>-1) like_btn_callback(is_like);
            else if (is_info>-1) info_btn_callback(is_info);
            else if (is_gt>-1) gt_btn_callback(is_gt);
            else if (is_sun>0) sun_btn_callback(is_sun);
            // else if (name=="like") {Main.ads.hidebanner(); FlxG.switchState(new LikeState());}
            else if (name=="like") {FlxG.switchState(new LikeState());}
            else if (name=="gthome") FlxG.openURL(Main.www + "/spisok-relizov.html","_blank");
            else if (name=="help") help_btn_callback();
            else{trace(name);}
            if (is_sun>0 || is_like>-1) Main.saveall();
        }
        Main.cantouch=true;
    }
    
    function guibtn_maker():Void{
        // static gui block
        var ax:Array<Int>=new Array(); //координаты спрайтов
        var ay:Array<Int>=new Array(); //координаты спрайтов
        var aa:Array<String>=new Array(); //png link
        var an:Array<String>=new Array(); //btn name
        
        aa.push("assets/images/g8080.png");
        aa.push("assets/images/g8080.png");
        aa.push("assets/images/g8080.png");
        aa.push("assets/images/g8080.png");
        aa.push("assets/images/g8080.png");
        aa.push("assets/images/g8080.png");
        aa.push("assets/images/g8080.png");
        aa.push("assets/images/g200160.png");//down bar first need mirror 
        aa.push("assets/images/g200160.png");
        aa.push("assets/images/g160160.png");
        aa.push("assets/images/g160160.png");
        
        an.push("help");
        an.push("20sun");
        an.push("40sun");
        an.push("60sun");
        an.push("80sun");
        an.push("100sun");
        an.push("gthome");
        an.push("page<");
        an.push("page>");
        an.push("like");
        an.push("new");
        
        
        var d:Int = 80;
        ax=[d*0,d*1,d*2,d*3,d*4,d*5,d*8,d*0,200,d*5,d*7];
        ay=[d*2,d*2,d*2,d*2,d*2,d*2,d*2,d*14,d*14,d*14,d*14];
        for (i in 0...11){
            a_guibtnstatic.push(new FlxButton(ax[i],ay[i],"",function():Void{guibtn_callback(an[i]);}));
            switch(i){
                case 9,10:a_guibtnstatic[i].loadGraphic(aa[i],true,160,160);
                case 7,8:a_guibtnstatic[i].loadGraphic(aa[i],true,200,160);
                default:a_guibtnstatic[i].loadGraphic(aa[i],true,80,80);
            }
            add(a_guibtnstatic[i]);
        }
        
        // like gui block rowleft then row right
        // ax=[d*0,d*0,d*0,d*0,d*0,d*0,d*0,d*0,d*0,d*0,d*8,d*8,d*8,d*8,d*8,d*8,d*8,d*8,d*8,d*8];
        ax=[for (i in 0...10) d*0].concat([for (i in 0...10) d*1]).concat([for (i in 0...10) d*8]);
        ay=[for (i in 4...14) d*i].concat([for (i in 4...14) d*i]).concat([for (i in 4...14) d*i]);
        // aa=[for (i in 0...20) "assets/images/g8080.png"];
        aa=[for (i in 0...10) "assets/images/g8080.png"].concat([for (i in 0...10) "assets/images/g48080.png"]).concat([for (i in 0...10) "assets/images/g8080.png"]);
        
        var lan:Array<String>=new Array();
        for (i in 1...11){
            lan.push("like"+Std.string(i));
        }
        for (i in 1...11){
            lan.push("info"+Std.string(i));
        }
        for (i in 1...11){
            lan.push("gt"+Std.string(i));
        }
        
        for (i in 0...30){
            a_guibtnlike.push(new FlxButton(ax[i],ay[i],"",function():Void{guibtn_callback(lan[i]);}));
            if (i<10 || i>=20) a_guibtnlike[i].loadGraphic(aa[i],true,80,80);
            else a_guibtnlike[i].loadGraphic(aa[i],true,480,80);
            add(a_guibtnlike[i]);
        }
        var b:FlxButton=new FlxButton(480,160,"",btn_llllcallback);
        b.loadGraphic("assets/images/g16080.png",true,160,80); add(b);
    }
    
    var a_text:Array<FlxText>=new Array();
    function textstylemaker(t:FlxText,font:String,fsize:Int,color:FlxColor,tfw:Int,text:String):Void
	{
		var style:FlxTextBorderStyle = FlxTextBorderStyle.OUTLINE;
		var afont:String="";
        if(font=="merri_bi"){afont="Merriweather-BoldItalic.ttf";}
        else{afont="guicompress.ttf";}
        t.setFormat("assets/data/"+afont, fsize, color);
		t.fieldWidth=tfw;
        t.text=text;
		t.alignment = CENTER;
		add(t);
	}
    function guitext_maker():Void{
        var ax:Array<Int>=new Array();
        var ay:Array<Int>=new Array();
        var at:Array<String>=new Array(); //default text
        var aw:Array<Int>=new Array(); //field width
        var as:Array<Int>=new Array(); //font size
        var an:Array<String>=new Array(); //font name roboto,vertasti
        ax=[0].concat([for (i in 0...10) 80]).concat([for (i in 0...10) 560]).concat([80]); // info , films x10, ready x10, pages
        ay=[240].concat([for (i in 4...14) i*80]).concat([for (i in 4...14) i*80]).concat([1160]);
        at=["полный список релизов"].concat([for (i in 0...10) "название релиза"]).concat([for (i in 0...10) "00"]).concat(["1/1"]);
        aw=[720].concat([for (i in 0...10) 480]).concat([for (i in 0...10) 80]).concat([240]);
        as=[30].concat([for (i in 0...10) 30]).concat([for (i in 0...10) 60]).concat([60]);
        an=["merri_bi"].concat([for (i in 0...10) "merri_bi"]).concat([for (i in 0...10) "guicompress"]).concat(["guicompress"]);
        for (i in 0...22){
            a_text.push(new FlxText(ax[i],ay[i]));
            textstylemaker(a_text[i],an[i],as[i],FlxColor.WHITE,aw[i],at[i]);
        }
    }
    
    function help_maker():Void{
        help=new FlxSprite(0,160,"assets/images/fullhelp1.png");
        help.visible=false;
    }
    
    public override function create():Void {
        super.create();
        Main.loadall();
        guifon_maker();
        guisym_maker();
        guitext_maker();
        guibtn_maker();
        help_maker();
        new_btn_callback();
        sun_btn_callback(Main.sun);
        // Main.ads.showbanner();
    }

    public override function update(elapsed:Float):Void {
        super.update(elapsed);

    }
}