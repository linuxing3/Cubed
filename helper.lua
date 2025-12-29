-- local function split_include_path(inputstr, sep)
--     local t = {}
--     -- Use a pattern to match characters that are *not* the separator
--     for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
--         table.insert(t, str)
--     end
--     return t
-- end

-- function merge_lists(table1, table2)
--     -- Start adding elements after the end of table1
--     local startIndex = #table1 + 1 
--     for _, value in ipairs(table2) do
--         table1[#table1 + 1] = value -- Append to the end
--     end
--     return table1
-- end

-- extra_includedirs_str = os.getenv("CXX_INCLUDE_PATH")

-- extra_includedirs = split_include_path(extra_includedirs_str, ":")
