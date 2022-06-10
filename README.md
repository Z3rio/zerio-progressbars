# Summary
I made a quick little progress bar just to give back to the community.
I hope you will like it, if you find any issues or wanna contribute to this project then private message me and I will gladly answer it.

# Preview
![Preview Image](https://user-images.githubusercontent.com/54480523/173077147-ddb278f9-e882-4199-a8f8-6a8e5e5c9740.png)
https://youtu.be/dru2YL2ltvA

# Example Usage
```lua
exports["zerio-progressbars"]:OpenProgressBar({
    allowcancel = true,
    time = 15,
    label = "Test",

    finished = function()
        print("finished")
    end

    canceled = function()
        print("canceled")
    end
})
```
