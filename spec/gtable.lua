local luaunit = require("luaunit")
local gtable = require("../src/gtable")

function test_it_should_return_an_empty_array_when_both_parameters_are_empty()
    local res = gtable.merge({}, {})

    luaunit.assertEquals(#res, 0)
end

function test_it_should_return_the_first_paramater_when_the_second_is_empty()
    local res = gtable.merge({1}, {})

    luaunit.assertEquals(#res, 1)
    luaunit.assertEquals(res[1], 1)
end

function test_it_should_return_the_second_paramater_when_the_first_is_empty()
    local res = gtable.merge({}, {1})

    luaunit.assertEquals(#res, 1)
    luaunit.assertEquals(res[1], 1)
end

function test_it_should_return_a_two_items_array()
    local res = gtable.merge({1}, {2})

    luaunit.assertEquals(#res, 2)
    luaunit.assertEquals(res[1], 1)
    luaunit.assertEquals(res[2], 2)
end

function test_it_should_return_a_four_items_array()
    local res = gtable.merge({1, 2}, {3, 4})

    luaunit.assertEquals(#res, 4)
    luaunit.assertEquals(res[1], 1)
    luaunit.assertEquals(res[2], 2)
    luaunit.assertEquals(res[3], 3)
    luaunit.assertEquals(res[4], 4)
end

function test_it_should_merge_two_single_character_arrays()
    local res = gtable.merge({'a'}, {'b'})

    luaunit.assertEquals(#res, 2)
    luaunit.assertEquals(res[1], 'a')
    luaunit.assertEquals(res[2], 'b')
end

function test_it_should_merge_two_single_string_arrays()
    local res = gtable.merge({'h', 'e'}, {'l', 'l', 'o'})

    luaunit.assertEquals(#res, 5)
    luaunit.assertEquals(res[1], 'h')
    luaunit.assertEquals(res[2], 'e')
    luaunit.assertEquals(res[3], 'l')
    luaunit.assertEquals(res[4], 'l')
    luaunit.assertEquals(res[5], 'o')
end

function test_it_should_prepend_to_an_array()
    local a = {1, 2}
    gtable.prepend(a, {3, 4})

    luaunit.assertEquals(#a, 4)
    luaunit.assertEquals(a[1], 3)
    luaunit.assertEquals(a[2], 4)
    luaunit.assertEquals(a[3], 1)
    luaunit.assertEquals(a[4], 2)
end

function test_it_should_append_to_an_array()
    local a = {1, 2}
    gtable.append(a, {3, 4})

    luaunit.assertEquals(#a, 4)
    luaunit.assertEquals(a[1], 1)
    luaunit.assertEquals(a[2], 2)
    luaunit.assertEquals(a[3], 3)
    luaunit.assertEquals(a[4], 4)
end

os.exit( luaunit.LuaUnit.run() )