-- WELWIUM Supabase setup
-- Run this in Supabase Dashboard -> SQL Editor after creating the admin user.

create extension if not exists pgcrypto;

create table if not exists public.admin_users (
  id uuid primary key references auth.users(id) on delete cascade,
  email text unique not null,
  created_at timestamptz not null default now()
);

create table if not exists public.products (
  id uuid primary key default gen_random_uuid(),
  slug text unique not null,
  name text not null,
  category text not null default 'WELWIUM collection',
  eyebrow text not null default 'A new essential',
  description text not null default '',
  detail text not null default '',
  price text not null default 'Price on request',
  image_url text not null default '',
  accent text not null default '#D7B77A',
  specs text[] not null default '{}',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.site_settings (
  id boolean primary key default true check (id = true),
  whatsapp_number text not null default '923001234567',
  hero_image_url text not null default '',
  hero_eyebrow text not null default 'A new signal from Pakistan',
  hero_heading text not null default 'Technology,|refined.',
  hero_subheading text not null default 'Objects for the moments that matter.\nQuietly intelligent. Beautifully considered.',
  philosophy_heading text not null default 'Less noise.|More signal.',
  philosophy_body text not null default 'WELWIUM is a premium technology house from Pakistan, building the things that sit quietly at the centre of a life well lived.',
  cta_heading text not null default 'Find your next|essential.',
  announcement text not null default 'The first collection is coming soon.',
  updated_at timestamptz not null default now()
);

alter table public.site_settings add column if not exists hero_eyebrow text not null default 'A new signal from Pakistan';
alter table public.site_settings add column if not exists hero_heading text not null default 'Technology,|refined.';
alter table public.site_settings add column if not exists hero_subheading text not null default 'Objects for the moments that matter.\nQuietly intelligent. Beautifully considered.';
alter table public.site_settings add column if not exists philosophy_heading text not null default 'Less noise.|More signal.';
alter table public.site_settings add column if not exists philosophy_body text not null default 'WELWIUM is a premium technology house from Pakistan, building the things that sit quietly at the centre of a life well lived.';
alter table public.site_settings add column if not exists cta_heading text not null default 'Find your next|essential.';

insert into public.site_settings (id) values (true) on conflict (id) do nothing;

alter table public.admin_users enable row level security;
alter table public.products enable row level security;
alter table public.site_settings enable row level security;

grant usage on schema public to anon, authenticated;
grant select on public.admin_users to authenticated;
grant select on public.products to anon, authenticated;
grant insert, update, delete on public.products to authenticated;
grant select on public.site_settings to anon, authenticated;
grant insert, update, delete on public.site_settings to authenticated;

drop policy if exists "Public can read products" on public.products;
create policy "Public can read products" on public.products for select to anon, authenticated using (true);

drop policy if exists "Admins can manage products" on public.products;
create policy "Admins can manage products" on public.products for all to authenticated
using (exists (select 1 from public.admin_users where id = auth.uid()))
with check (exists (select 1 from public.admin_users where id = auth.uid()));

drop policy if exists "Public can read settings" on public.site_settings;
create policy "Public can read settings" on public.site_settings for select to anon, authenticated using (true);

drop policy if exists "Admins can manage settings" on public.site_settings;
create policy "Admins can manage settings" on public.site_settings for all to authenticated
using (exists (select 1 from public.admin_users where id = auth.uid()))
with check (exists (select 1 from public.admin_users where id = auth.uid()));

drop policy if exists "Admins can read admin list" on public.admin_users;
create policy "Admins can read admin list" on public.admin_users for select to authenticated using (id = auth.uid());

insert into public.admin_users (id, email)
select id, email from auth.users where email = 'welwium@gmail.com'
on conflict (id) do update set email = excluded.email;

insert into public.products (slug, name, category, eyebrow, description, detail, price, image_url, accent, specs)
values
('aura','AURA / 01','Ambient intelligence','The quiet signal','A calm, always-ready interface for the spaces you inhabit.','AURA / 01 is the first ambient intelligence object: responsive, unobtrusive, and tuned to the rhythm of your day.','PKR 48,500','/assets/welwium-aura.webp','#D7B77A',array['Ambient field sensing','Onyx glass enclosure','USB-C / wireless ready']),
('orbit','ORBIT / 02','Personal systems','Your next essential','A wearable thought companion designed around your attention.','ORBIT / 02 imagines a more intentional relationship with technology — precise, tactile, and personal.','PKR 62,000','/assets/welwium-orbit.webp','#E6A39A',array['Adaptive haptics','Titanium champagne shell','7-day concept battery']),
('veil','VEIL / 03','Portable intelligence','Clarity, carried','A tactile screen concept for work that moves with you.','VEIL / 03 imagines a thinner, quieter kind of portable computing.','PKR 118,000','/assets/welwium-veil.webp','#D7B77A',array['Edge-to-edge glass','Focus mode interface','Studio-grade display']),
('node','NODE / 04','Home intelligence','A softer centre','The understated centre of a more considered home.','NODE / 04 makes connected living feel less connected to a screen and more connected to you.','PKR 39,000','/assets/welwium-node.webp','#E6A39A',array['Multi-room awareness','Local-first controls','Silent dawn indicator']),
('solace','SOLACE / 05','Recovery systems','Rest, reimagined','A future-facing ritual for the moments between everything else.','SOLACE / 05 is a soft interface for breath, light, and the small spaces where your day resets.','PKR 54,500','/assets/welwium-hero.webp','#D7B77A',array['Dawn light therapy','Quiet room sensing','Material-led controls'])
on conflict (slug) do nothing;

-- Create this bucket from Storage -> New Bucket in the dashboard, named site-media.
-- Keep it public for product and hero image URLs used by the storefront.
