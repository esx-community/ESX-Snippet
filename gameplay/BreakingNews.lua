--[[
----------------------------------------------------------------------------
____________________________________________________________________________
						
						AUTHOR : Stivicx

			Affiche le scaleform journaliste
			Display Scaleform Breaking news
		

____________________________________________________________________________
						
---------------------------------------------------------------------------
]]--

function breakingnews()
    scaleform = RequestScaleformMovie("breaking_news")
    while not HasScaleformMovieLoaded(scaleform) do
        Citizen.Wait(0)
    end

    PushScaleformMovieFunction(scaleform, "SET_TEXT")
    PushScaleformMovieFunctionParameterString("Quit")
    PushScaleformMovieFunctionParameterString("<b>Bold</b> <i>Italics</i> ~r~Coloured ~d~")
    PopScaleformMovieFunctionVoid()
    
    PushScaleformMovieFunction(scaleform, "SET_SCROLL_TEXT")
    PushScaleformMovieFunctionParameterInt(0) -- top ticker
    PushScaleformMovieFunctionParameterInt(0) -- Since this is the first string, start at 0
    PushScaleformMovieFunctionParameterString("This will be displayed at the top")
    PopScaleformMovieFunctionVoid()

    
    PushScaleformMovieFunction(scaleform, "DISPLAY_SCROLL_TEXT")
    PushScaleformMovieFunctionParameterInt(0) -- Top ticker
    PushScaleformMovieFunctionParameterInt(0) -- Index of string
    PopScaleformMovieFunctionVoid()
    end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        breakingnews()
    end
end)