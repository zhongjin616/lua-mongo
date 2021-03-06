local test = {
	uri = 'mongodb://127.0.0.1',
	dbname = 'lua-mongo-test',
	collname = 'test',
	filename = 'lua-mongo-test-file',
}

local function equal(v1, v2)
	if type(v1) ~= 'table' or type(v2) ~= 'table' then
		return v1 == v2
	end
	if v1 == v2  then
		return true
	end
	if not equal(getmetatable(v1), getmetatable(v2)) then
		return false
	end
	for k, v in pairs(v1) do
		if not equal(v, v2[k]) then
			return false
		end
	end
	for k, v in pairs(v2) do
		if not equal(v, v1[k]) then
			return false
		end
	end
	return true
end

function test.equal(v1, v2)
	assert(equal(v1, v2), 'values differ!')
end

function test.key(t, x)
	for k in pairs(t) do
		if equal(k, x) then
			return
		end
	end
	error('key not found!')
end

function test.value(t, x)
	for _, v in pairs(t) do
		if equal(v, x) then
			return
		end
	end
	error('value not found!')
end

function test.error(s, e)
	assert(not s, 'status is ok!')
	assert(type(e) == 'string', 'error is not string!')
end

function test.failure(f, ...)
	assert(type(f) == 'function', 'not a function!')
	assert(not pcall(f, ...), 'call succeeded!')
end

return test
