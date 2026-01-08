# Guide: Using Storybook Packages from GitHub

## ✅ Packages Successfully Published!

The following 4 packages are now available on GitHub Packages:

- `@marvinlaubenstein/addon-a11y@10.1.0-alpha.10`
- `@marvinlaubenstein/addon-docs@10.1.0-alpha.10`
- `@marvinlaubenstein/addon-links@10.1.0-alpha.10`
- `@marvinlaubenstein/react-vite@10.1.0-alpha.10`

## Setup in Your Project

### 1. Create .npmrc File

Create a `.npmrc` file in your project root:

```
@marvinlaubenstein:registry=https://npm.pkg.github.com
//npm.pkg.github.com/:_authToken=<YOUR_GITHUB_TOKEN>
```

**IMPORTANT:** Add `.npmrc` to your `.gitignore`!

```
echo ".npmrc" >> .gitignore
```

### 2. Install Packages

Replace your yalc references:

**Before:**

```json
{
  "dependencies": {
    "@storybook/addon-a11y": "file:.yalc/@storybook/addon-a11y",
    "@storybook/addon-docs": "file:.yalc/@storybook/addon-docs",
    "@storybook/addon-links": "file:.yalc/@storybook/addon-links",
    "@storybook/react-vite": "file:.yalc/@storybook/react-vite"
  }
}
```

**After:**

```json
{
  "dependencies": {
    "@marvinlaubenstein/addon-a11y": "10.1.0-alpha.10",
    "@marvinlaubenstein/addon-docs": "10.1.0-alpha.10",
    "@marvinlaubenstein/addon-links": "10.1.0-alpha.10",
    "@marvinlaubenstein/react-vite": "10.1.0-alpha.10"
  }
}
```

Or install directly:

```bash
yarn add @marvinlaubenstein/addon-a11y@10.1.0-alpha.10
yarn add @marvinlaubenstein/addon-docs@10.1.0-alpha.10
yarn add @marvinlaubenstein/addon-links@10.1.0-alpha.10
yarn add @marvinlaubenstein/react-vite@10.1.0-alpha.10
```

### 3. Update Storybook Configuration

In your `.storybook/main.js` or `.storybook/main.ts`:

**Before:**

```js
export default {
  framework: "@storybook/react-vite",
  addons: [
    "@storybook/addon-a11y",
    "@storybook/addon-docs",
    "@storybook/addon-links",
  ],
};
```

**After:**

```js
export default {
  framework: "@marvinlaubenstein/react-vite",
  addons: [
    "@marvinlaubenstein/addon-a11y",
    "@marvinlaubenstein/addon-docs",
    "@marvinlaubenstein/addon-links",
  ],
};
```

## Publishing Updates

When you make changes to the packages:

### 1. In the storybook-forked Repository:

```bash
cd /Users/A79051381/storybook-forked

# Make your changes...

# Recompile
gtimeout 600s yarn task --task compile

# Publish new version (bump version first!)
# Increment version in package.json files, e.g. 10.1.0-alpha.11

npm publish --tag alpha code/addons/a11y
npm publish --tag alpha code/addons/docs
npm publish --tag alpha code/addons/links
npm publish --tag alpha code/frameworks/react-vite
```

### 2. In Your Project:

```bash
# Update packages
yarn upgrade @marvinlaubenstein/addon-a11y@10.1.0-alpha.11
yarn upgrade @marvinlaubenstein/addon-docs@10.1.0-alpha.11
yarn upgrade @marvinlaubenstein/addon-links@10.1.0-alpha.11
yarn upgrade @marvinlaubenstein/react-vite@10.1.0-alpha.11
```

## Working from Other Machines

On each new machine:

1. Clone repository
2. Create `.npmrc` with token (see above)
3. Run `yarn install`

Done! ✅

## View Packages on GitHub

You can see your packages here:

- https://github.com/marvinLaubenstein?tab=packages

## Troubleshooting

### "404 Not Found" Error During Install

- Make sure `.npmrc` is correct
- Check if the token is still valid
- GitHub token needs `read:packages` permission

### "ENEEDAUTH" Error

- Token is not set or incorrect
- Check the `.npmrc` file

### Package Not Found

- Wait 1-2 minutes after publishing
- Make sure the package is set to public
