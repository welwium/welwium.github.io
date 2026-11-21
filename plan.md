# WELWIUM Website Plan

## Product and implementation

WELWIUM will be a premium Pakistan-based technology brand site with public routes for Home, Products, Product Detail, About, and Contact, plus a hidden `/admin` route. The first pass will use a React/Wouter frontend with Framer Motion for performant scroll reveals and interaction, a small server/tRPC layer for future persistence, and a Drizzle schema that leaves room for managed products and media. The admin route will use a client-side password gate for this prototype, with a clear upgrade path to server-backed authentication before production launch.

The initial catalogue will contain five placeholder products. Product cards will be glassmorphic, limited to three per row, and expand into detail views with a carousel-like media strip, description, price placeholder, buy-now CTA, and related products. The Contact page will collect a visitor's details and open a WhatsApp message draft using a configurable placeholder Pakistan number until the real number is supplied. The admin dashboard will expose product and imagery controls in a simple editorial layout; changes are represented in local state for this first pass and are structured so they can move to database/storage-backed procedures.

SEO foundations will include route-aware titles/descriptions, Open Graph/Twitter metadata, JSON-LD organization/product markup, `public/robots.txt`, `public/sitemap.xml`, and `public/manus-routes.json`. The canonical origin will remain configurable rather than guessing from the internal preview host.

## Design system

### Candidate styles
- Quiet luxury technology editorial — 0.06
- Obsidian product gallery — 0.05
- Champagne-futurist atelier — 0.04

Chosen: **Quiet luxury technology editorial**.

### Design Movement
A restrained fusion of boutique hospitality and near-future product editorial: dark, cinematic, tactile, and spacious rather than dashboard-like.

### Core Principles
1. High contrast and negative space make the brand feel expensive.
2. Large imagery leads; copy stays short and intentional.
3. Every interaction has a soft physical response: lift, sheen, blur, or reveal.
4. Content is presented in editorial bands rather than dense utility grids.

### Color Philosophy
Onyx is the grounding 40% field, champagne is the warm 50% surface and type accent that makes the experience feel material, and dawn is the restrained 10% signal color for moments of attention. The signature brand color is a pale champagne-gold `#D7B77A` with a faint dawn rose edge `#E6A39A`.

### Layout Paradigm
A single continuous canvas uses full-bleed visual bands and overlapping editorial panels. Home sections pin and stack visually while scrolling; catalogue content remains breathable with staggered cards instead of a rigid dashboard grid.

### Signature Elements
- Hairline champagne borders and soft grain overlays.
- Glass panels with `backdrop-filter`, low-opacity fills, and a single highlight sheen.
- Small uppercase KAGLIS labels paired with OSWALD display titles.

### Interaction Philosophy and Animation
Animations are transform/opacity-first, with motion kept within 240–700ms and eased for a calm, physical response. Cards lift 8–12px, image crops ease gently, and reveal animations trigger once through IntersectionObserver/Framer Motion. Avoid large blur animations or layout thrashing. Respect `prefers-reduced-motion`.

### Typography System
Use Oswald for headings and navigation display, Libre Baskerville for paragraphs and metadata, and a local `Kaglis` fallback stack for subheadings/eyebrows. If the proprietary Kaglis font is supplied later, it can replace the fallback through one `@font-face` declaration.

### Brand Essence and Voice
WELWIUM is intelligent technology, refined for people who care how the future feels. Personality: composed, curious, exacting. CTAs sound like “Explore the system” and “Find your next essential,” never “Click here.”

### Wordmark and logo
Use a spaced WELWIUM wordmark with a minimal dawn-colored orbit mark: a thin ellipse intersecting a small champagne point. The mark is CSS/SVG so it remains crisp and easy to replace with final identity artwork.

## Project structure

- `client/src/App.tsx`: route map, page shell, metadata helper.
- `client/src/pages/`: Home, Products, ProductDetail, About, Contact, Admin, NotFound.
- `client/src/components/`: navigation, footer, product cards, glass buttons, reveal wrappers, admin panels.
- `client/src/data/`: placeholder catalogue and site settings.
- `client/src/index.css`: palette, typography, glass and motion primitives.
- `public/`: generated visual assets, robots, sitemap, and route manifest.
- `drizzle/` and `server/`: existing managed backend foundation, extended only where helpful for future persistence.
