/* This file was generated by upbc (the upb compiler) from the input
 * file:
 *
 *     xds/core/v3/authority.proto
 *
 * Do not edit -- your changes will be discarded when the file is
 * regenerated. */

#include <stddef.h>
#include "upb/msg_internal.h"
#include "xds/core/v3/authority.upb.h"
#include "xds/annotations/v3/status.upb.h"
#include "validate/validate.upb.h"

#include "upb/port_def.inc"

static const upb_msglayout_field xds_core_v3_Authority__fields[1] = {
  {1, UPB_SIZE(0, 0), 0, 0, 9, _UPB_MODE_SCALAR | (_UPB_REP_STRVIEW << _UPB_REP_SHIFT)},
};

const upb_msglayout xds_core_v3_Authority_msginit = {
  NULL,
  &xds_core_v3_Authority__fields[0],
  UPB_SIZE(8, 16), 1, _UPB_MSGEXT_NONE, 1, 255,
};

static const upb_msglayout *messages_layout[1] = {
  &xds_core_v3_Authority_msginit,
};

const upb_msglayout_file xds_core_v3_authority_proto_upb_file_layout = {
  messages_layout,
  NULL,
  1,
  0,
};

#include "upb/port_undef.inc"

