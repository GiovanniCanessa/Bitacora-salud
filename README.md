# Bitácora de salud (Aurentya): prueba de concepto

PWA (web instalable en iPhone y Android) con Supabase como base de datos y login.

## Puesta en marcha (unos 20 minutos)

1. **Crear el proyecto en Supabase.** Crea una cuenta en supabase.com y un proyecto nuevo (plan gratuito). Elige una región cercana, por ejemplo São Paulo.
2. **Crear la tabla.** En SQL Editor, pega todo `schema.sql` y presiona Run.
3. **Crear tu usuario.** En Authentication > Users > Add user, crea tu usuario con correo y contraseña (marca "Auto confirm").
4. **Cerrar registros nuevos.** En Authentication > Sign In / Providers, desactiva "Allow new users to sign up" para que nadie más pueda crear cuenta.
5. **Configurar la app.** En Project Settings > API, copia la *Project URL* y la *anon public key*, y pégalas en `SUPABASE_URL` y `SUPABASE_ANON_KEY` dentro de `index.html`.
6. **Publicar.** Arrastra la carpeta completa a app.netlify.com/drop, o súbela a Vercel o GitHub Pages. Necesita HTTPS para instalarse como app.
7. **Instalar en el teléfono.**
   - iPhone (Safari): Compartir > Agregar a inicio.
   - Android (Chrome): menú > Instalar app.

## Qué incluye

- Login con correo y contraseña.
- Registro con fecha, lugar, servicio, especialidad, médico, link del portal, código de acceso y notas.
- Línea de tiempo agrupada por año.
- Búsqueda libre (ej.: "rodillas") y filtro por especialidad.
- Autocompletado de lugar, médico y especialidad a partir de lo ya registrado.
- Botón que copia el código y abre el portal en un solo toque.
- Código oculto por defecto, con opción de mostrarlo.
- Exportación a CSV, para que la información no quede amarrada a la app.

