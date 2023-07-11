List<String> calculateCheckout(int score) {
  List<String> checkouts = [];
  switch (score) {
    case 170:
      checkouts.add("T20 T20 D25");
      break;
    case 169:
      break;
    case 168:
      break;
    case 167:
      checkouts.add("T20 T19 D25");
      break;
    case 166:
      break;
    case 165:
      break;
    case 164:
      checkouts.add("T20 T18 D25");
      checkouts.add("T19 T19 D25");
      break;
    case 163:
      break;
    case 162:
      break;
    case 161:
      checkouts.add("T20 T17 D25");
      break;
    case 160:
      checkouts.add("T20 T20 D20");
      break;
    case 159:
      break;
    case 158:
      checkouts.add("T20 T20 D19");
      break;
    case 157:
      checkouts.add("T20 T19 D20");
      break;
    case 156:
      checkouts.add("T20 T20 D18");
      break;
    case 155:
      checkouts.add("T20 T19 D19");
      break;
    case 154:
      checkouts.add("T20 T18 D20");
      checkouts.add("T19 T19 D20");
      break;
    case 153:
      checkouts.add("T20 T19 D18");
      break;
    case 152:
      checkouts.add("T20 T20 D16");
      break;
    case 151:
      checkouts.add("T20 T17 D20");
      break;
    case 150:
      checkouts.add("T20 T18 D18");
      checkouts.add("T20 D25 D20");
      break;
    case 149:
      checkouts.add("T20 T19 D16");
      break;
    case 148:
      checkouts.add("T20 T20 D14");
      checkouts.add("T20 T16 D20");
      break;
    case 147:
      checkouts.add("T20 T17 D18");
      break;
    case 146:
      checkouts.add("T20 T18 D16");
      checkouts.add("T19 T19 D16");
      break;
    case 145:
      checkouts.add("T20 T19 D14");
      checkouts.add("T20 T15 D20");
      break;
    case 144:
      checkouts.add("T20 T20 D12");
      checkouts.add("T18 T18 D18");
      checkouts.add("T20 T16 D18");
      break;
    case 143:
      checkouts.add("T20 T17 D16");
      break;
    case 142:
      checkouts.add("T20 T14 D20");
      checkouts.add("T20 T18 D14");
      checkouts.add("T20 D25 D16");
      break;
    case 141:
      checkouts.add("T20 T19 D12");
      checkouts.add("T17 T18 D18");
      break;
    case 140:
      checkouts.add("T20 T20 D10");
      checkouts.add("T20 T16 D16");
      break;
    case 139:
      checkouts.add("T19 T14 D20");
      checkouts.add("T19 T18 D14");
      checkouts.add("T20 T19 D11");
      checkouts.add("T19 D25 D16");
      break;
    case 138:
      checkouts.add("T20 T18 D12");
      break;
    case 137:
      checkouts.add("T20 T19 D10");
      break;
    case 136:
      checkouts.add("T20 T20 D8");
      break;
    case 135:
      checkouts.add("D25 T19 D14 (25 T20 D25)");
      checkouts.add("D25 T15 D20 (25 T20 D25)");
      checkouts.add("T20 T17 D12");
      break;
    case 134:
      checkouts.add("T20 T14 D16");
      break;
    case 133:
      checkouts.add("T20 T19 D8");
      break;
    case 132:
      checkouts.add("D25 T14 D20 (25 T19 D25)");
      checkouts.add("D25 D25 D16");
      checkouts.add("T20 T20 D6 | T20 T16 D12 | T20 T12 D18");
      break;
    case 131:
      checkouts.add("T20 T13 D16");
      checkouts.add("T19 T14 D16");
      break;
    case 130:
      checkouts.add("T20 T20 D5 (20 T20 D25)");
      checkouts.add("T20 T18 D8 | T20 T10 D20");
      break;
    case 129:
      checkouts.add("T19 T20 D6 (19 T20 D25)");
      break;
    case 128:
      checkouts.add("T18 T14 D16 (18 T20 D25)");
      checkouts.add("T18 T18 D10 (18 T20 D25)");
      break;
    case 127:
      checkouts.add("T20 T17 D8 (T20 17 D25) -> (20 T19 D25)");
      break;
    case 126:
      checkouts.add("T19 T19 D6 (T19 19 D25) -> (19 T19 D25)");
      break;
    case 125:
      checkouts.add("25 T20 D20 (D25 T17 D12) -> (D25 25 D25)");
      checkouts.add("T18 T13 D16 (18 T19 D25)");
      break;
    case 124:
      checkouts.add("T20 T14 D11 (20 T18 D25) -> (T20 14 D25)");
      break;
    case 123:
      checkouts.add("T19 T16 D9 (T19 16 D25) -> (19 T18 D25)");
      break;
    case 122:
      checkouts.add("T18 T18 D7 (T18 18 D25) -> (18 T18 D25)");
      break;
    case 121:
      checkouts.add("T20 T11 D14 (T20 11 D25) -> (20 T17 D25)");
      break;
    case 120:
      checkouts.add("T20 20 D20 (20 T20 D20)");
      break;
    case 119:
      checkouts.add("T19 T12 D13 (T19 12 D25) -> (19 T20 D20)");
      break;
    case 118:
      checkouts.add("T20 18 D20 (20 T20 D19)");
      checkouts.add("T18 14 D25 (18 T20 D20)");
      break;
    case 117:
      checkouts.add("T20 17 D20 (20 T19 D20)");
      checkouts.add("T19 20 D20 (19 T20 D19)");
      break;
    case 116:
      checkouts.add("T20 16 D20 (20 T20 D18)");
      checkouts.add("T19 19 D20 (19 T19 D20)");
      break;
    case 115:
      checkouts.add("T19 18 D20 (19 T20 D18)");
      break;
    case 114:
      checkouts.add("T20 14 D20 (20 T18 D20)");
      checkouts.add("T18 20 D20 (18 T20 D18)");
      break;
    case 113:
      checkouts.add("T20 13 D20 (20 T19 D18)");
      checkouts.add("T19 16 D20 (19 T18 D20)");
      break;
    case 112:
      checkouts.add("T20 20 D16 (20 T20 D16)");
      checkouts.add("T18 18 D20 (18 T18 D20)");
      checkouts.add("T19 19 D18 (19 T19 D18)");
      break;
    case 111:
      checkouts.add("T19 14 D20 (19 T20 D16)");
      checkouts.add("T20 19 D16 (20 T17 D20)");
      checkouts.add("T17 20 D20 (17 T18 D20)");
      break;
    case 110:
      checkouts.add("T20 18 D16 (20 T18 D18)");
      checkouts.add("T20 D25");
      break;
    case 109:
      checkouts.add("T20 17 D16 (20 T19 D16)");
      checkouts.add("T19 20 D16 (19 T18 D18)");
      break;
    case 108:
      checkouts.add("T19 19 D16 (19 T19 D16)");
      checkouts.add("T18 18 D18 (18 T18 D18)");
      checkouts.add("T20 16 D16 (20 T20 D14) -> (20 T16 D20)");
      checkouts.add("T17 17 D20 (17 T17 D20)");
      break;
    case 107:
      checkouts.add("T20 15 D16 (20 T18 D18)");
      checkouts.add("T19 18 D16 (19 T20 D14) -> (19 T16 D20)");
      checkouts.add("T19 D25");
      break;
    case 106:
      checkouts.add("T20 14 D16 (20 T18 D16)");
      checkouts.add("T20 6 D20");
      checkouts.add("T20 6 D20");
      checkouts.add("T20 10 D18");
      break;
    case 105:
      checkouts.add("T20 13 D16 (20 T19 D14) -> (20 T15 D20)");
      break;
    case 104:
      checkouts.add("T20 12 D16 (20 T20 D12) -> (20 T16 D18)");
      checkouts.add("T18 18 D16 (18 T18 D16)");
      checkouts.add("T19 15 D16 (19 T19 D14)");
      checkouts.add("T18 D25");
      break;
    case 103:
      checkouts.add("T20 11 D16 (20 T17 D16)");
      checkouts.add("T20 3 D20 (20 T17 D16)");
      checkouts.add("T20 19 D12 (20 T17 D16)");
      break;
    case 102:
      checkouts.add("T20 10 D16 (20 T14 D20) -> (20 T18 D14)");
      break;
    case 101:
      checkouts.add("T20 9 D16 (20 T19 D12) -> (20 T15 D18)");
      checkouts.add("T19 12 D16 (19 T14 D20) -> (19 T18 D14)");
      checkouts.add("T17 D25");
      break;
    case 100:
      checkouts.add("T20 D20 (20 T20 D10)");
      break;
    case 99:
      checkouts.add("T19 10 D16 (19 T20 D10)");
      checkouts.add("T19 6 D18 (19 T20 D10)");
      break;
    case 98:
      checkouts.add("T20 D19 (20 T18 D12)");
      break;
    case 97:
      checkouts.add("T19 D20 (19 T18 D12)");
      break;
    case 96:
      checkouts.add("T20 D18 (20 T20 D8)");
      break;
    case 95:
      checkouts.add("D25 13 D16 (25 T20 D5) -> (25 20 D25)");
      checkouts.add("T19 D19 (19 T20 D7)");
      break;
    case 94:
      checkouts.add("D25 12 D16 (25 T19 D6) -> (25 19 D25)");
      checkouts.add("T18 D20 (18 T20 D8)");
      break;
    case 93:
      checkouts.add("D25 11 D16 (25 T18 D7) -> (25 18 D25)");
      checkouts.add("T19 D18 (19 T14 D16)");
      break;
    case 92:
      checkouts.add("D25 10 D16 (25 T17 D8) -> (25 17 D25)");
      checkouts.add("T20 D16 (20 T20 D6) -> (20 T16 D12)");
      break;
    case 91:
      checkouts.add("D25 9 D16 (25 T16 D9) -> (25 16 D25)");
      checkouts.add("T17 D20 (17 T14 D16)");
      break;
    case 90:
      checkouts.add("T20 D15 (20 T20 D5) -> (20 20 D25)");
      checkouts.add("D25 D20 (25 25 D20)");
      break;
    case 89:
      checkouts.add("T19 D16 (19 T20 D4) -> (19 20 D25)");
      break;
    case 88:
      checkouts.add("T20 D14 (20 T18 D7) -> (20 18 D25)");
      checkouts.add("T16 D20 (16 T20 D6) -> (16 T16 D12)");
      break;
    case 87:
      checkouts.add("T17 D18 (17 T20 D5) -> (17 20 D25)");
      break;
    case 86:
      checkouts.add("T18 D16 (18 T18 D7) -> (18 18 D25)");
      break;
    case 85:
      checkouts.add("T19 D14 (19 T16 D9) -> (19 16 D25)");
      checkouts.add("T15 D20 (15 T20 D5) -> (15 20 D25)");
      break;
    case 84:
      checkouts.add("T20 D12 (20 T14 D11) -> (20 14 D25)");
      checkouts.add("T16 D18 (16 T18 D7) -> (16 18 D25)");
      break;
    case 83:
      checkouts.add("T17 D16 (17 T16 D9) -> 17 16 D25");
      break;
    case 82:
      checkouts.add("D25 D16 (25 17 D20)");
      break;

    case 81:
      checkouts.add("T19 D12 (19 T12 D13) -> 19 12 D25");
      break;
    case 80:
      checkouts.add("T20 D10 (20 20 D20)");
      checkouts.add("T16 D16 (16 T16 D8)");
      break;
    case 79:
      checkouts.add("T19 D11 (19 20 D20)");
      checkouts.add("T13 D20 (13 16 D25)");
      break;
    case 78:
      checkouts.add("T18 D12 (18 20 D20)");
      break;
    case 77:
      checkouts.add("T19 D10 (19 18 D20)");
      break;
    case 76:
      checkouts.add("T20 D8 (20 16 D20)");
      checkouts.add("T16 D14 (16 20 D20)");
      break;
    case 75:
      checkouts.add("T17 D12 (17 18 D20)");
      break;
    case 74:
      checkouts.add("T14 D16 (14 20 D20)");
      break;
    case 73:
      checkouts.add("T19 D8 (19 14 D20)");
      break;
    case 72:
      checkouts.add("T20 D6 (20 20 D16)");
      checkouts.add("T16 D12 (16 16 D20)");
      checkouts.add("T12 D18 (12 20 D20)");
      break;
    case 71:
      checkouts.add("T13 D16 (13 18 D20)");
      break;
    case 70:
      checkouts.add("T18 D8 (18 20 D16)");
      checkouts.add("T10 D20 (10 20 D20)");
      break;
    case 69:
      checkouts.add("T15 D12 (15 14 D20)");
      checkouts.add("T19 D6 (19 18 D16)");
      break;
    case 68:
      checkouts.add("T20 D4 (20 16 D16)");
      checkouts.add("T12 D16 (12 16 D20)");
      break;
    case 67:
      checkouts.add("T17 D8 (17 18 D16)");
      break;
    case 66:
      checkouts.add("T10 D18 (10 16 D20)");
      checkouts.add("T14 D12 (14 20 D16)");
      checkouts.add("T18 D6 (18 16 D16)");
      break;
    case 65:
      checkouts.add("25 D20 (D25 7 D4)");
      checkouts.add("T19 D4 (19 6 D20)");
      break;
    case 64:
      checkouts.add("T16 D8 (16 16 D16)");
      break;
    case 63:
      checkouts.add("T13 D12 (13 18 D16)");
      checkouts.add("T17 D6 (17 6 D20)");
      checkouts.add("T9 D18 (9 14 D20)");
      break;
    case 62:
      checkouts.add("T10 D16 (10 20 D16)");
      checkouts.add("T14 D10 (14 16 D16)");
      break;
    case 61:
      checkouts.add("25 D18 (D25 3 D4)");
      checkouts.add("T15 D8 (15 6 D20)");
      break;
    case 60:
      checkouts.add("20 D20");
      break;
    case 59:
      checkouts.add("19 D20");
      break;
    case 58:
      checkouts.add("18 D20");
      break;
    case 57:
      checkouts.add("17 D20");
      break;
    case 56:
      checkouts.add("16 D20");
      break;
    case 55:
      checkouts.add("15 D20");
      break;
    case 54:
      checkouts.add("18 D18");
      break;
    case 53:
      checkouts.add("13 D20");
      break;
    case 52:
      checkouts.add("20 D16");
      break;
    case 51:
      checkouts.add("19 D16");
      break;
    case 50:
      checkouts.add("18 D16");
      checkouts.add("D25");
      break;
    case 49:
      checkouts.add("17 D16");
      break;
    case 48:
      checkouts.add("16 D16");
      break;
    case 47:
      checkouts.add("15 D16");
      break;
    case 46:
      checkouts.add("14 D16");
      break;
    case 45:
      checkouts.add("13 D16");
      break;
    case 44:
      checkouts.add("12 D16");
      break;
    case 43:
      checkouts.add("11 D16");
      break;
    case 42:
      checkouts.add("10 D16");
      break;
    case 41:
      checkouts.add("9 D16");
      break;
    case 40:
      checkouts.add("D20");
      break;
    case 39:
      checkouts.add("7 D16");
      break;
    case 38:
      checkouts.add("D19");
      break;
    case 37:
      checkouts.add("5 D16");
      break;
    case 36:
      checkouts.add("D18");
      break;
    case 35:
      checkouts.add("3 D16");
      break;
    case 34:
      checkouts.add("D17");
      break;
    case 33:
      checkouts.add("1 D16");
      break;
    case 32:
      checkouts.add("D16");
      break;
    case 31:
      checkouts.add("7 D12");
      break;
    case 30:
      checkouts.add("D15");
      break;
    case 29:
      checkouts.add("17 D6");
      break;
    case 28:
      checkouts.add("D14");
      break;
    case 27:
      checkouts.add("19 D4");
      break;
    case 26:
      checkouts.add("D13");
      break;
    case 25:
      checkouts.add("17 D4");
      break;
    case 24:
      checkouts.add("D12");
      break;
    case 23:
      checkouts.add("19 D2");
      break;
    case 22:
      checkouts.add("D11");
      break;
    case 21:
      checkouts.add("17 D2");
      break;
    case 20:
      checkouts.add("D10");
      break;
    case 19:
      checkouts.add("11 D4");
      break;
    case 18:
      checkouts.add("D9");
      break;
    case 17:
      checkouts.add("13 D2");
      break;
    case 16:
      checkouts.add("D8");
      break;
    case 15:
      checkouts.add("13 D1");
      break;
    case 14:
      checkouts.add("D7");
      break;
    case 13:
      checkouts.add("11 D1");
      break;
    case 12:
      checkouts.add("D6");
      break;
    case 11:
      checkouts.add("3 D4");
      break;
    case 10:
      checkouts.add("D5");
      break;
    case 9:
      checkouts.add("1 D4");
      break;
    case 8:
      checkouts.add("D4");
      break;
    case 7:
      checkouts.add("3 D2");
      break;
    case 6:
      checkouts.add("D3");
      break;
    case 5:
      checkouts.add("1 D2");
      break;
    case 4:
      checkouts.add("D2");
      break;
    case 3:
      checkouts.add("1 D1");
      break;
    case 2:
      checkouts.add("D1");
      break;
  }
  return checkouts;
}
