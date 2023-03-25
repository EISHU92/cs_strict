--CS:GO Addiction #1
-- Every 1 strike, warn
--AutoMuter V0.1BETA

--This stric mod will save every action that happen to server
local storage = minetest.get_mod_storage()

local forbidden_words = { "puto", "puta", "mierda", "estupida", "estupido", "shit", "fuck", "fuckyou", "put@" }  
minetest.register_on_chat_message(function(name, message)
  for _, word in pairs(forbidden_words) do
    if message:find(word) then
      minetest.chat_send_player(name, "You are not allowed to beg in this server.")
        if tonumber(storage:get_string("strikes."..name)) then
            empty()
        else
            storage:set_string("strikes."..name, 0)
        end
        if not (storage:get_string("strikes."..name) == 3) then
            storage:set_string("strikes."..name, storage:get_string("strikes."..name) + 1)
        else
            minetest.kick_player(name, "You have been kicked from the game because you broke some rules!")
        end
      return true
    end
  end
end)