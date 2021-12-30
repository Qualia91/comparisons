local function TreeNode(v, l, r)
	return {
		val = v,
		left = l,
		right = r
	}
end

local function PrintTree(tree_node)
    if (tree_node.left ~= nil and tree_node.right ~= nil) then
        return PrintTree(tree_node.left) .. ", " 
                .. tree_node.val .. ", " 
                .. PrintTree(tree_node.right)
    end
    if (tree_node.left ~= nil) then
        return PrintTree(tree_node.left) .. ", " .. tree_node.val
    end
    if (tree_node.right ~= nil) then
        return tree_node.val .. ", " .. PrintTree(tree_node.right)
    end
    return tree_node.val
end

local Root = TreeNode(
    100, 
    TreeNode(1), 
    TreeNode(50, nil, TreeNode(7)))

print(PrintTree(Root))