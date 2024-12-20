local M = {}

M.read_file = function(path)
	local file = io.open(path, "rb")
	if not file then
		return nil
	end

	local lines = {}

	for line in io.lines(path) do
		local words = {}
		for word in line:gmatch("%w+") do
			table.insert(words, word)
		end
		table.insert(lines, words)
	end

	file:close()
	return lines
end

M.filter_inplace = function(t, filterIter)
	local out = {}

	for k, v in pairs(t) do
		if filterIter(v, k, t) then
			table.insert(out, v)
		end
	end

	return out
end

M.tablecontains = function(t, v)
	if next(t) == nil then
		return false
	else
		for i = 1, #t do
			if t[i] == v then
				return true
			end
		end
		return false
	end
end
return M
