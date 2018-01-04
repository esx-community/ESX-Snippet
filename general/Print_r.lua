--[[
----------------------------------------------------------------------------
____________________________________________________________________________

			1) AUTHOR : robmiracle (Github)
      2) AUTHOR : Sylundef

			1) Fonction print_r (style php) 2) print_r simple
			1) print_r function (php like) 2) print_r simple


http://prntscr.com/hghb56
____________________________________________________________________________

---------------------------------------------------------------------------
]]--


-- 1)
local function print_r ( t )
    local print_r_cache={}
        local function sub_print_r(t,indent)
        if (print_r_cache[tostring(t)]) then
            print(indent.."*"..tostring(t))
        else
            print_r_cache[tostring(t)]=true
            if (type(t)=="table") then
                local tLen = #t
                for i = 1, tLen do
                    local val = t[i]
                    if (type(val)=="table") then
                        print(indent.."#["..i.."] => "..tostring(t).." {")
                        sub_print_r(val,indent..string.rep(" ",string.len(i)+8))
                        print(indent..string.rep(" ",string.len(i)+6).."}")
                    elseif (type(val)=="string") then
                        print(indent.."#["..i..'] => "'..val..'"')
                    else
                        print(indent.."#["..i.."] => "..tostring(val))
                    end
                end
                for pos,val in pairs(t) do
                   if type(pos) ~= "number" or math.floor(pos) ~= pos or (pos < 1 or pos > tLen) then
                       if (type(val)=="table") then
                           print(indent.."["..pos.."] => "..tostring(t).." {")
                           sub_print_r(val,indent..string.rep(" ",string.len(pos)+8))
                           print(indent..string.rep(" ",string.len(pos)+6).."}")
                       elseif (type(val)=="string") then
                           print(indent.."["..pos..'] => "'..val..'"')
                       else
                           print(indent.."["..pos.."] => "..tostring(val))
                       end
                   end
               end
           else
               print(indent..tostring(t))
           end
       end
   end

  if (type(t)=="table") then
       print(tostring(t).." {")
       sub_print_r(t,"  ")
       print("}")
   else
       sub_print_r(t,"  ")
   end

  print()
end
-- 2)


function dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end
-- Usage : print(dump('my_data'))
