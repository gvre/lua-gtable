-- gtable.lua
-- author: Giannis Vrentzos <gvre@gvre.gr>
-- https://github.com/gvre
-- License: MIT

local M = {
    __VERSION = "0.0.1",
    __DESCRIPTION = "A small helper library about tables",
    __URL = "https://github.com/gvre/lua-gtable",
    __LICENSE = [[
    The MIT License (MIT)
    Copyright (c) 2018 Giannis Vrentzos
    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:
    The above copyright notice and this permission notice shall be included in all
    copies or substantial portions of the Software.
    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
    SOFTWARE.
  ]],
}

function M.merge(a, b)
    local c = {}

    for i = 1, #a do
        table.insert(c, a[i])
    end

    for i = 1, #b do
        table.insert(c, b[i])
    end

    return c
end

function M.prepend(a, b)
    for i = 1, #b do
        table.insert(a, i, b[i])
    end
end

function M.append(a, b)
    for i = 1, #b do
        table.insert(a, b[i])
    end
end

return M
