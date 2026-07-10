for i=1,100 do
    print(i,
#game:GetService("ReplicatedStorage"):WaitForChild("__ServerBrowser"):InvokeServer(i)
    )
end

local args = {
	"teleport",
	"c3816d5f-8978-4e42-9799-4de60d9fb520"
}
game:GetService("ReplicatedStorage"):WaitForChild("__ServerBrowser"):InvokeServer("teleport",ID)
