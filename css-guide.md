# CSS Guide

* [General](#general)
* [Folder and File Structure](#folder-and-file-structure)
* [Preprocessing](#preprocessing)
* [Declaration Order](#declaration-order)
* [Units](#units)
* [Colors](#colors)
* [Comments](#comments)
* [Specificity](#specificity)
* [Class Naming](#class-naming)
* [Media Queries](#media-queries)
* [Validation](#validation)
* [Optimization](#optimization)
* [CSS Libraries and Code Snippets](#css-libraries-and-code-snippets)
* [Style Framework](#style-framework)
* [Stylus Resources and Libraries](#stylus-resources-and-libraries)
* [Further Materials](#further-reading)

## General
* use two spaces for indentation (here is how to set that up in: [Sublime Text](http://www.sublimetext.com/docs/2/indentation.html), [TextMate](http://manual.macromates.com/en/working_with_text) or [Emacs](http://www.emacswiki.org/emacs/NoTabs))
* use colons (although Stylus allows their omittance)
* put spaces after colons in property declarations
* separate rules with new lines

## Folder and File Structure
One of the key ingredients to creating a clean project is defining a meaningful structure. Borrowing from Unix philosophy we want to make small, independent modules of CSS that form the base scaffolding. 

### Folder structure
```
css
├── components
│   ├── buttons.styl
│   └── forms.styl
├── globals
│   ├── _variables.styl
│   ├── _placeholders.styl
|   └── _mixins.styl
├── plugins
|   ├── animate.css
│   └── normalize.css
├── sections
│   ├── issues.styl
│   ├── profile.styl
│   └── landing.styl
```

How the scaffolding looks really depends on the size of the project. Sometimes having the following will suffice:
```
css
├── globals
│   ├── _variables.styl
│   └── _placeholders.styl
├── components
│   ├── buttons.styl
│   └── forms.styl
├── sections
│   ├── landing.styl
│   └── help.styl
```

* **Globals** - variables, placeholders and mixins
* **Compontents** - base components of the website/app (`base.styl`, `buttons.styl`, `grid.styl`)
* **Plugins** - external CSS, being it resets, normalize or JavaScript library helpers
* **Sections** - page or cross-page specific content, but usually not global (`landing.styl`, `comments.styl`, etc.)

### Primary Stylesheet
Outside of these folders, directly in the main CSS directory, is where our **primary stylesheet** lives. It only includes imports of necessary modules. Its compiled version is being linked to directly in the app's `<head>`. 

## Preprocessing
We use [Stylus](http://learnboost.github.io/stylus/) (unless there is a need to depend on a framework written in Sass or Less, then for the sake of maintainability and upgrades - use the source's preprocessor).

* global $variables and @mixins/$placeholders should be stored in **globals/_variables** and **globals/_mixins** respectively
* aforementioned files should be **imported first** in project's main stylesheet
* try not to nest further than **3 levels deep**
* be cautious of code repetitiveness when using **@extend** - consider using a **$placeholder** if applicable (for more clarification read about [The Extend Concept](http://css-tricks.com/the-extend-concept/) that clarifies both)

### Further reading
* [Variables in Stylus](http://learnboost.github.io/stylus/docs/variables.html)
* [Mixins in Stylus](http://learnboost.github.io/stylus/docs/mixins.html)
* [Importing in Stylus](http://learnboost.github.io/stylus/docs/import.html)
* [Extend and placeholders in Stylus](http://learnboost.github.io/stylus/docs/extend.html)
* [Avoid nested selectors for more modular CSS](http://thesassway.com/intermediate/avoid-nested-selectors-for-more-modular-css)

## Declaration Order
For more effective scanning put declarations in the following order:

1. Display and box model
2. Positioning
3. Typography
4. Color
5. Other

See example [here](http://css-tricks.com/poll-results-how-do-you-order-your-css-properties/).

## Units
* omit units after “0”
* omit leading “0”s in values (example: .5em not 0.5em)
* use [unitless line heights](http://meyerweb.com/eric/thoughts/2006/02/08/unitless-line-heights/)
* use pixels or rems for element sizing
* use ems or rems for font sizes (introduction to both can be found [here](http://snook.ca/archives/html_and_css/font-size-with-rem))

**Disclaimer:** rem unit is relative to the root element font size which makes the math easier, thus it's recommended over ems. Rems [are supported](http://caniuse.com/#search=rem) in majority of modern desktop and mobile browsers.

## Colors
* use **variables** for storing reusable colors
* for same color variations use [color operations](http://learnboost.github.io/stylus/docs/operators.html)
* defer to hex/RGBA for one-time colors (if their usage is necessary)
* in case of hex use 3 character hexadecimal notation wherever possible

## Comments
* include sectioning comments at the beginning of the file and anywhere else inside it if necessary
* prefix the section names with `$` for better searchability
* for inline, local commenting use `//`

**Example comment:**
```css
/*---------------------------------------------
 * $BUTTONS
 ---------------------------------------------*/
```

## Specificity
Specificity determines, which CSS rule is applied by the browsers.

* use the least number of selectors required to style an element
* IDs are supposed to be **unique** - use them sparingly, for elements that appear only once and don't share styles
* **if in doubt - use classes**
* avoid using IDs and classes with type selectors (not `ul#item-list` but `#item-list`)

## Class Naming

* **Use hyphens**, not underscores or camelCase
* If you are manipulating HTML elements with JavaScript, use either **data-* attributes** or **js-* prefixed classes** (e.g. *js-draggable*). Those classes are JavaScript specific, and shouldn't be used in stylesheets as a point of reference for styling. This separates the presentation layer and helps to avoid unnecessary confusion and errors in code execution if a class is accidentaly removed.
* Follow the rules of semantics - make classes descriptive and not reliable on appearance of the given element

### Further reading
* [What Makes a Semantic Class Name](http://css-tricks.com/semantic-class-names/)
* [Semantics and Sensibility](http://csswizardry.com/2010/08/semantics-and-sensibility/)
* [Semantic CSS With Intelligent Selectors](http://coding.smashingmagazine.com/2013/08/20/semantic-css-with-intelligent-selectors/)

## Media Queries
When writing media queries make sure to include them:

* in the same file, where the modified element was defined
* at the end of the file under media query rule

This makes searching easier, files are modular and redundancy is avoided. To make working with breakpoints easier consider using the following variables:

```stylus
$smartphone = '(max-width: 480px)'
$tablet = '(min-width: 481px) and (max-width: 1023px)'
$desktop = '(min-width: 1024px)'
$desktop-wide = '(min-width: 1200px)'
```

Then define the media queries:

```stylus
@media $smartphone
```

## Validation
Validation is optional but helpful in establishing good coding practices and not serving erroneous CSS. 

### Further reading
* Validate with [W3C markup validator](http://validator.w3.org/)
* [Lint in Sublime Text](https://github.com/SublimeLinter/SublimeLinter-for-ST2)

## Optimization
1. Detect unused selectors with [Helium](https://github.com/geuis/helium-css) or Chrome's Developer Tools audit
2. Minify and gzip the CSS
3. Optimize images with [ImageOptim](http://imageoptim.com/) (automation with [ImageOptim-CLI](https://github.com/JamieMason/ImageOptim-CLI))
4. Optimize SVGs with [SVG Gui](https://github.com/svg/svgo-gui) (automation with [SVGO](https://github.com/svg/svgo))

Helium isn't mandatory - it helps automate detecting code redundancy. Minification and gzip should happen pre-deploy. 

## CSS Libraries and Code Snippets

* the preferential reset is [normalize.css ](https://github.com/necolas/normalize.css)
* the preferential way of clearing floats is [micro-clearfix hack](http://nicolasgallagher.com/micro-clearfix-hack/)

Both of those are included in the style framework described below. No other recommendations are made, use your best judgement and don't unnecessarily include piles of bloated code.

## Style Framework
Style is a minimal framework created and maintained by @thefoxis. Its purpose is to help prototype and build apps more effectively while maintaining code's uniformity.

* source code and instructions for in-app usage can be found on [Github](https://github.com/andyet/style)
* [list of releases](https://github.com/andyet/style/releases)
* [feature requests](https://github.com/andyet/style/issues?labels=feature+request&page=1&state=open) • [bugs](https://github.com/andyet/style/issues?labels=bug&page=1&state=open)
* CSS and markup samples can be found on [Github Pages](http://andyet.github.io/style/)

## Stylus Resources and Libraries
* [Nib](https://github.com/visionmedia/nib) — basic Stylus mixins
* [Dookie](https://github.com/voronianski/dookie-css#documentation) — another mixin and compontents library, that features some useful snippets, that are non-existent in Nib
* [Jeet](https://github.com/mojotech/jeet) — an advanced grid system
* [Platonic](https://github.com/davidpaulrosser/stylus-platonic) — a pure CSS 3D library

## Further Materials

* [Idiomatic CSS](https://github.com/necolas/idiomatic-css) by Nicolas Gallagher
* [CSS Guidelines](https://github.com/csswizardry/CSS-Guidelines) by Harry Roberts
* [About HTML semantics and front-end architecture](http://nicolasgallagher.com/about-html-semantics-front-end-architecture/) by Nicolas Gallagher
* [The single responsibility principle applied to CSS](http://csswizardry.com/2012/04/the-single-responsibility-principle-applied-to-css/) by Harry Roberts
* [OOCSS + Sass = The best way to CSS](http://ianstormtaylor.com/oocss-plus-sass-is-the-best-way-to-css/) by Ian Storm Taylor
* [Creating Living Style Guides to Improve Performance](http://www.stubbornella.org/content/2013/06/05/creating-living-style-guides-to-improve-performance/) by Nicole Sullivan
* [A style-guide for modular SASS development using SMACSS and BEM](https://medium.com/objects-in-space/f6f404727) by Andrew Colclough