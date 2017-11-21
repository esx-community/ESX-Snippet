--[[
----------------------------------------------------------------------------
____________________________________________________________________________
						
						AUTHOR : woulf_alpha

						Maj ESX Script (pas sur)
						Update ESX Script (not sure)

					
____________________________________________________________________________
						
---------------------------------------------------------------------------
]]--

-- POC ESX_UPDATE  Woulf_Alpha 2017

-- Compare version github & local script
function IsUpdate( l, github )
    local n = string.gsub(l, "%.", "")
    local github = string.gsub(github, "%.", "")

    if tonumber(github) > tonumber(n) then
        return false
    end
    return true
end

-- GITHUB DOWNLOAD MASTER.ZIP 
function GetUpdateFile(resouceName, version)
    print('Download new version ::: ' )
    PerformHttpRequest('https://github.com/ESX-Org/' .. resouceName .. '/archive/' .. version .. '.zip', function(err, file, headers)
        SaveResourceFile(resouceName, 'update' .. version .. '.zip', file, string.len( file ))
        print('Download end ::: ' )
                                          -- UNZIP WORK    
    end, 'GET', "", { ["Content-Type"] = 'application/zip' })
end


-- GITHUB READ __RESOURCES.LUA 
function GetGithubResource(resourceName)
    PerformHttpRequest('https://raw.githubusercontent.com/ESX-Org/'.. resourceName ..'/master/__resource.lua', function(err, resource, headers) 
        for s in string.gmatch(resource, "([^\n]*)\n?") do
            if string.match(s, 'version') then

                if string.len( s ) < 20 then
                    github = string.sub( s, 10, 14 )
                    local_script = GetResourceMetadata(resourceName, 'version', 0)
                    print(resourceName .. '\nVersion :::: ' .. local_script .. '\nGithub  :::: ' .. github )
                    if IsUpdate(local_script, github) == false then
                        GetUpdateFile(resourceName, github)
                    end
                end
            end
        end
        end, 'GET')
end

-- 
AddEventHandler('onResourceStart', function(resource)


    version = GetResourceMetadata(resource, 'version', 0)

    if version ~= nil then
        GetGithubResource(resource)
    end

end)