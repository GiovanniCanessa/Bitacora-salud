-- Bitácora de atenciones médicas — esquema para Supabase
-- Pegar completo en: Supabase > SQL Editor > New query > Run

create table if not exists public.atenciones (
  id             uuid primary key default gen_random_uuid(),
  user_id        uuid not null default auth.uid() references auth.users(id) on delete cascade,
  fecha          date not null,
  lugar          text not null,
  servicio       text,          -- ej.: Resonancia de rodillas
  especialidad   text,          -- ej.: Traumatología
  medico         text,
  portal_url     text,          -- link donde quedaron los resultados/imágenes
  codigo_acceso  text,          -- código entregado para ver el examen
  notas          text,
  created_at     timestamptz not null default now(),
  updated_at     timestamptz not null default now()
);

create index if not exists atenciones_user_fecha_idx
  on public.atenciones (user_id, fecha desc);

-- Cada usuario solo ve y modifica sus propias filas
alter table public.atenciones enable row level security;

create policy "ver propias"      on public.atenciones for select using (auth.uid() = user_id);
create policy "crear propias"    on public.atenciones for insert with check (auth.uid() = user_id);
create policy "editar propias"   on public.atenciones for update using (auth.uid() = user_id) with check (auth.uid() = user_id);
create policy "eliminar propias" on public.atenciones for delete using (auth.uid() = user_id);

-- Mantener updated_at al día
create or replace function public.set_updated_at()
returns trigger language plpgsql as $$
begin
  new.updated_at = now();
  return new;
end $$;

drop trigger if exists atenciones_updated_at on public.atenciones;
create trigger atenciones_updated_at
  before update on public.atenciones
  for each row execute function public.set_updated_at();
