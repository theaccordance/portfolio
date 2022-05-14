export default ({ env }) => ({
  auth: {
    secret: env('ADMIN_JWT_SECRET', '00c45aeba35e65c70061030f33f7c2ea'),
  },
});
