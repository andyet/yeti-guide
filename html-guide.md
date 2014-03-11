# HTML Guide

* [Comments and Sectioning](#comments-and-sectioning)
* [HTML Quotation Marks](#html-quotation-marks)
* [HTML Entities](#html-entities)
* [Type Attributes](#type-attributes)
* [Optional Tags](#optional-tags)
* [Nested Tags](#nested-tags)
* [Classes](#classes)
* [Semantics](#semantics)
* [Accessibility](#accessibility)
* [HTML/Jade Boilerplate](#html/jade-boilerplate)

## Comments and Sectioning
When writing in pure HTML use comments after the closing tag of a major section:


```html
<div class="content">
  <div class="box">
    <p>I am a box.</p>
   </div>
</div>
<!-- content --> 
```

In both Jade and HTML insert blank lines between major sections and elements (use your best judgement here):

```jade
nav
  ul
   li I am a list.

.content
  .box
    p I am a box.
    
 footer
   p I am a footer.
```

This drastically improves the readability of code.

## HTML Quotation Marks
Use double quotation marks for attribute values.

## HTML Entities
Use custom characters instead of HTML entities, but be sure to have UTF-8 encoding set up (default in HTML boilerplate). To access the list of characters hit `⌘+⌃+Space` (Command + Control + Space). This doesn't work in Sublime Text though (try Chrome or other apps input fields, hackpad, IM or others).

## Type Attributes
Omit type attributes in Javascript and CSS files (meaning no **text/css** and **text/javascript**):

```html
<script src="js/bundle.js"></script>
<link rel="stylesheet" href="css/main.css">
```

## Optional Tags
Omit optional tags (this is a preference, not necessarily a requirement). If choosing to omit any, omit all optional tags, not a selection of those.

### Further reading
* [List of optional tags](http://www.whatwg.org/specs/web-apps/current-work/multipage/syntax.html#syntax-tag-omission)

## Nested Tags
While it's more consistent to use piping text for nesting for maintainability's sake it's advised to nest HTML within Jade. 

Example:
```jade
p This <strong>text</strong> needs to be emphasized
```

## Classes
Decide on one method of adding classes to elements.

Use this:
```jade
a(class="list-item active", href="")
a.list-item.active(href="")
```

Not:
```jade
a.list-item(class="active", href="")
```

The first version from the example is preferred (more readable). Also notice how `class` attribute is the first one listed. If dealing with conditionals in class names consider mixed approach.
  
## Semantics
Make use of HTML5 semantic elements for structuring the document, such as:

* `<header>`
* `<nav>`
* `<aside>`
* `<section>`
* `<article>`
* `<footer>`
* `<figure>` and `<figcaption>`

For the complete list of new elements refer to the documentation.

### Further reading
* [HTML5 Semantics](http://html5doctor.com/article-archive/)
* [W3C HTML Specification](http://www.w3.org/html/wg/drafts/html/CR/)

## Accessibility
ARIA is a W3C specification that improves semantics of HTML. It also increases accessibility by assigning meaning to specific areas and elements (especially for screenreaders).

For basic support make use of **landmark roles**:
```html
<header role="banner"></header>
<nav role="navigation"></nav>
<input type="search" role="search" />
<form role="form"></form>
<aside role="complementary"></nav>
<div class="content" role="main"></div>
<footer role="contentinfo"></footer>
```

For enhanced support use advanced roles, states and properties that can be found in the documentation below.

### Further Reading
* [W3C WAI ARIA](http://www.w3.org/TR/wai-aria/)
* [ARIA and Progressive Enhancement](http://alistapart.com/article/aria-and-progressive-enhancement/)
* [Using WAI-ARIA landmarks](http://blog.paciellogroup.com/2013/02/using-wai-aria-landmarks-2013/)

## HTML/Jade Boilerplate
For workflow automation and consistency use HTML Boilerplate (available in Jade and HTML):

* [source code](https://github.com/thefoxis/html-boilerplate)
* [issues list](https://github.com/thefoxis/html-boilerplate/issues?labels=&page=1&state=open)