if tup.getconfig('NO_JWASM') ~= "" then return end

if     tup.getconfig("LANG") == "it_IT" then
  tup.definerule{command = "echo LANG_IT = 1 > %o", outputs = {"lang.inc"}}
elseif tup.getconfig("LANG") == "es_ES" then
  tup.definerule{command = "echo LANG_SP = 1 > %o", outputs = {"lang.inc"}}
elseif tup.getconfig("LANG") == "ru_RU" then
  tup.definerule{command = "echo LANG_RU = 1 > %o", outputs = {"lang.inc"}}
elseif tup.getconfig("LANG") == "en_US" then
  tup.definerule{command = "echo LANG_EN = 1 > %o", outputs = {"lang.inc"}}
else
  tup.definerule{command = "echo LANG_EN = 1 > %o", outputs = {"lang.inc"}}
end

tup.rule({"InputBox.asm", extra_inputs = {"lang.inc"}}, "jwasm -I" .. tup.getvariantdir() .. " -zt0 -coff -Fi lang.inc -Fo %o %f " .. tup.getconfig("KPACK_CMD"), "INPUTBOX.OBJ")
