local luaunit = require("luaunit")
local gtable = require("../src/gtable")

function test_it_should_return_an_empty_array_when_both_parameters_are_empty()
    local res = gtable.merge({}, {})

    luaunit.assertEquals(#res, 0)
end

function test_it_should_return_the_first_parameter_when_the_second_is_empty()
    local res = gtable.merge({1}, {})

    luaunit.assertEquals(#res, 1)
    luaunit.assertEquals(res[1], 1)
end

function test_it_should_return_the_second_parameter_when_the_first_is_empty()
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

function test_it_should_return_true_when_parameter_is_a_table()
    luaunit.assertTrue(gtable.is_table({}))
end

function test_it_should_return_false_when_parameter_is_an_int()
    luaunit.assertFalse(gtable.is_table(1))
end

function test_it_should_return_false_when_parameter_is_an_string()
    luaunit.assertFalse(gtable.is_table("test"))
end

function test_it_should_return_true_when_parameter_is_an_empty_table()
    luaunit.assertTrue(gtable.is_empty({}))
end

function test_it_should_return_false_when_parameter_is_an_empty_string()
    luaunit.assertFalse(gtable.is_empty(""))
end

function test_it_should_return_true_when_table_key_exists()
    local t = {["k"] = "v"}

    luaunit.assertTrue(gtable.key_exists(t, "k"))
end

function test_it_should_return_false_when_table_key_does_not_exist()
    local t = {["k"] = "v"}

    luaunit.assertFalse(gtable.key_exists(t, "a"))
end

function test_it_should_return_false_when_checking_for_key_in_an_int()
    luaunit.assertFalse(gtable.key_exists(1, "a"))
end

function test_it_should_return_false_when_checking_for_key_in_a_string()
    luaunit.assertFalse(gtable.key_exists("table", "a"))
end

function test_it_should_return_false_when_table_does_not_contain_the_given_value()
    luaunit.assertFalse(gtable.find({"a", "b"}, "z"))
end

function test_it_should_return_zero_when_table_contains_the_given_value_but_before_the_start_position()
    luaunit.assertEquals(0, gtable.find({"a", "b", "c"}, "a", 2))
end

function test_it_should_return_the_position_of_the_given_parameter()
    luaunit.assertEquals(2, gtable.find({"a", "b"}, "b"))
end

function test_it_should_return_zero_when_table_contains_the_given_value_but_before_the_start_position()
    luaunit.assertEquals(2, gtable.find({"a", "b", "c"}, "b", 2))
end

function test_it_should_return_false_if_start_position_is_more_than_table_size()
    luaunit.assertFalse(gtable.find({"a", "b", "c"}, "b", 4))
end

function test_it_should_ignore_negative_start_values()
    luaunit.assertEquals(2, gtable.find({"a", "b", "c"}, "b", -1))
end

function test_it_should_reverse_an_empty_table()
    luaunit.assertEquals({}, gtable.reverse({}))
end

function test_it_should_reverse_a_table_with_one_item()
    local t = {1}

    luaunit.assertEquals({1}, gtable.reverse(t))
end

function test_it_should_reverse_a_table()
    local t = {1, 2}

    luaunit.assertEquals({2, 1}, gtable.reverse(t))
end

function test_it_should_remove_empty_values_using_the_default_callback()
    local t = {1, false, nil, 2}

    luaunit.assertEquals({1, 2}, gtable.filter(t))
end

function test_it_should_remove_values_with_key_less_than_three()
    local t = {1, 2, 3, 4, 5}
    local callback = function(v, k)
        return k > 3
    end

    luaunit.assertEquals({4, 5}, gtable.filter(t, callback))
end

function test_it_should_remove_values_less_that_three()
    local t = {1, 2, 3, 4, 5}
    local callback = function(v)
        return v > 3
    end

    luaunit.assertEquals({4, 5}, gtable.filter(t, callback))
end

function test_it_should_remove_all_values()
    local t = {1, 2, 3, 4, 5}
    local callback = function(v)
        return v > 10
    end

    luaunit.assertEquals({}, gtable.filter(t, callback))
end

function test_it_should_remove_an_item_with_specific_key()
    local expected = {["k2"] = "v2", ["k3"] = "v3"}
    local t = {["k1"] = "v1", ["k2"] = "v2", ["k3"] = "v3"}
    local callback = function(v, k)
        return k ~= "k1"
    end

    luaunit.assertEquals(expected, gtable.filter_map(t, callback))
end

os.exit( luaunit.LuaUnit.run() )
