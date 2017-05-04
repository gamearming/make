/* Convenience header for conditional use of GNU <libintl.h>.
  Copyright (C) 1995-2016 Free Software Foundation, Inc.
  This file is part of GNU Make.

  GNU Make is free software; you can redistribute it and/or modify it under the
  terms of the GNU General Public License as published by the Free Software
  Foundation; either version 3 of the License, or (at your option) any later
  version.

  GNU Make is distributed in the hope that it will be useful, but WITHOUT ANY
  WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
  A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

  You should have received a copy of the GNU General Public License along with
  this program.  If not, see <http://www.gnu.org/licenses/>.  */

#ifndef _LIBGETTEXT_H
#define _LIBGETTEXT_H 1

// NLS can be disabled through the configure --disable-nls option.
// NLS 可以通過 --disable-nls 選項來停用。
#if ENABLE_NLS
  #include <libintl.h> // 獲取 gnu 消息目錄函數的聲明。 Get declarations of GNU message catalog functions.
#else
  /* Disabled NLS.
  The casts to 'const char *' serve the purpose of producing warnings
  for invalid uses of the value returned from these functions.
  On pre-ANSI systems without 'const', the config.h file is supposed to
  contain "#define const".
  停用 NLS。
  “const char *”的轉換用於為這些函數返回的值的無效使用生成警告。
  在沒有“const”的pre-ANSI系統下，config.h文件應該包含“#define const”。

  */
  #define gettext(Msgid) ((const char *) (Msgid))
  #define dgettext(Domainname, Msgid) ((const char *) (Msgid))
  #define dcgettext(Domainname, Msgid, Category) ((const char *) (Msgid))
  #define ngettext(Msgid1, Msgid2, N)                           ((N) == 1 ? (const char *) (Msgid1) : (const char *) (Msgid2))
  #define dngettext(Domainname, Msgid1, Msgid2, N)              ((N) == 1 ? (const char *) (Msgid1) : (const char *) (Msgid2))
  #define dcngettext(Domainname, Msgid1, Msgid2, N, Category)   ((N) == 1 ? (const char *) (Msgid1) : (const char *) (Msgid2))
  #define textdomain(Domainname) ((const char *) (Domainname))
  #define bindtextdomain(Domainname, Dirname) ((const char *) (Dirname))
  #define bind_textdomain_codeset(Domainname, Codeset) ((const char *) (Codeset))
#endif

/* A pseudo function call that serves as a marker for the automated
   extraction of messages, but does not call gettext().  The run-time
   translation is done at a different place in the code.
   The argument, String, should be a literal string.  Concatenated strings
   and other string expressions won't work.
   The macro's expansion is not parenthesized, so that it is suitable as
   initializer for static 'char[]' or 'const char[]' variables.  */
#define gettext_noop(String) String

#endif /* _LIBGETTEXT_H */
