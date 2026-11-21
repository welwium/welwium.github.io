export type Product = {
  slug: string;
  name: string;
  category: string;
  eyebrow: string;
  description: string;
  detail: string;
  price: string;
  image: string;
  accent: string;
  specs: string[];
};

export const imageUrls = {
  hero: "/assets/welwium-hero.webp",
  aura: "/assets/welwium-aura.webp",
  orbit: "/assets/welwium-orbit.webp",
  veil: "/assets/welwium-veil.webp",
  node: "/assets/welwium-node.webp",
};

export const products: Product[] = [
  { slug: "aura", name: "AURA / 01", category: "Ambient intelligence", eyebrow: "The quiet signal", description: "A calm, always-ready interface for the spaces you inhabit.", detail: "AURA / 01 is a placeholder for WELWIUM's first ambient intelligence object: responsive, unobtrusive, and tuned to the rhythm of your day.", price: "PKR 48,500", image: imageUrls.aura, accent: "#D7B77A", specs: ["Ambient field sensing", "Onyx glass enclosure", "USB-C / wireless ready"] },
  { slug: "orbit", name: "ORBIT / 02", category: "Personal systems", eyebrow: "Your next essential", description: "A wearable thought companion designed around your attention.", detail: "ORBIT / 02 is a placeholder wearable for a more intentional relationship with technology — precise, tactile, and personal.", price: "PKR 62,000", image: imageUrls.orbit, accent: "#E6A39A", specs: ["Adaptive haptics", "Titanium champagne shell", "7-day concept battery"] },
  { slug: "veil", name: "VEIL / 03", category: "Portable intelligence", eyebrow: "Clarity, carried", description: "A tactile screen concept for work that moves with you.", detail: "VEIL / 03 imagines a thinner, quieter kind of portable computing: a screen that disappears into the work and returns only when needed.", price: "PKR 118,000", image: imageUrls.veil, accent: "#D7B77A", specs: ["Edge-to-edge glass", "Focus mode interface", "Studio-grade display"] },
  { slug: "node", name: "NODE / 04", category: "Home intelligence", eyebrow: "A softer centre", description: "The understated centre of a more considered home.", detail: "NODE / 04 is a placeholder home hub designed to make connected living feel less connected to a screen and more connected to you.", price: "PKR 39,000", image: imageUrls.node, accent: "#E6A39A", specs: ["Multi-room awareness", "Local-first controls", "Silent dawn indicator"] },
  { slug: "solace", name: "SOLACE / 05", category: "Recovery systems", eyebrow: "Rest, reimagined", description: "A future-facing ritual for the moments between everything else.", detail: "SOLACE / 05 is a placeholder recovery object: a soft interface for breath, light, and the small spaces where your day resets.", price: "PKR 54,500", image: imageUrls.hero, accent: "#D7B77A", specs: ["Dawn light therapy", "Quiet room sensing", "Material-led controls"] },
];

export const siteSettings = {
  whatsappNumber: "923001234567",
  adminPassword: "welwium-demo",
};
