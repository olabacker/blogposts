Guide to initialize and use the css framework Tailwind in Blazor | [tailwind] [blazor]

This guide uses the standalone CLI of tailwind which needs to be downloaded from [here](https://tailwindcss.com/blog/standalone-cli). The initial step to integrate Tailwind is to execute the following command below in the root folder of the blazor project.

```bash
tailwindcss init
```

This generates the `tailwind.config.js` file which is the configuration file for tailwind. In here you need to specify which files in the folder structure that may contain html elements using tailwind classes. In a standard blazor project this includes all `html` and `razor` files so lets specify that.  

```js
module.exports = {
  content: ['./**/*/.{razor,html}'],
  theme: {
    extend: {},
  },
  plugins: [],
}
```

Add a `css` file to you project which acts as an input to tailwind. Add the following lines to the file. 

```css
@tailwind base;
@tailwind components;
@tailwind utilities;
```

In this file it is also possible to add global tailwind classes to elements. Below is an example of the tailwind class `font-extrabold` will be applied to all `h1` in the project.

```css
h1 {
    @apply font-extrabold
}
```

After that tailwind needs to generate the resulting output css file according to the rules set up and the classes used in the project. 

```bash
 tailwindcss -i .\Styles\input.css -o .\wwwroot\css\tailwind.css
 ```

The output file needs to be references in the head of the html file as a stylesheet.

```html
<head>
    ..
    <link href="css/tailwind.css" rel="stylesheet" />
    ..
</head>
```

When developing with tailwind you can add the `--watch` argument to the tailwind cli and it will continously watch for changes in the project files and regenerate the output css file.

```bash
 tailwindcss -i .\Styles\input.css -o .\wwwroot\css\tailwind.css --watch
 ```
