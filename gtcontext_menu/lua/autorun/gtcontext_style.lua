/*------------------------------------------
			ADDON BY GAYTOZ 
------------------------------------------*/

/*------------------------------------------
			HOW TO ADD A STYLE ?

	GTContext.style["..."] = {
	color1 = Color(YOUR COLOR),  ----- GENERAL BACKGROUND-COLOR
	color2 = Color(YOUR COLOR),  ----- BACKGROUND-COLOR FOR THE "INFORMATIONS", "COMMANDS", AND "NAME OF YOUR SERVER" TEXTS
	color3 = Color(YOUR COLOR),  ----- BACKGROUND-COLOR FOR THE BUTTONS
    color4 = Color(YOUR COLOR),  ----- TEXT-COLOR FOR THE BUTTONS
    color5 = Color(YOUR COLOR),  ----- BACKGROUND-COLOR FOR "Name", "Job"...
    color6 = Color(YOUR COLOR)   ----- SCROLL BAR COLOR
    }

------------------------------------------*/

GTContext.style = {}

GTContext.style["base"] = {
	color1 = Color(0, 0, 30, 230),
	color2 = Color(66, 66, 66, 255),
	color3 = Color(50, 18, 50, 255), 
    color4 = Color(66, 70, 80, 255),
    color5 = Color(50, 50, 50, 150),
    color6 = Color(0, 0, 0, 255)
}

GTContext.style["red"] = {
	color1 = Color(255, 0, 0, 230),
	color2 = Color(150, 20, 0, 255),
	color3 = Color(100, 30, 20, 255), 
    color4 = Color(150, 70, 60, 255),
    color5 = Color(250, 50, 50, 150),
    color6 = Color(150, 0, 0, 255)
}

GTContext.style["blue"] = {
	color1 = Color(0, 0, 255, 230),
	color2 = Color(0, 20, 150, 255),
	color3 = Color(20, 30, 100, 255), 
    color4 = Color(60, 70, 150, 255),
    color5 = Color(50, 50, 250, 150),
    color6 = Color(0, 0, 150, 255)
}

GTContext.style["redandblue"] = {
	color1 = Color(255, 0, 0, 230),
	color2 = Color(0, 20, 255, 255),
	color3 = Color(255, 150, 50, 255), 
    color4 = Color(0, 0, 255, 255),
    color5 = Color(0, 0, 255, 255),
    color6 = Color(255, 0, 0, 255)
}
