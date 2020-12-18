class Meal {
  final String mealTime, name, imagePath, preparation;

  final List ingredients;

  Meal(
      {this.mealTime,
      this.name,
      this.imagePath,
      this.preparation,
      this.ingredients});
}

final meals = [
  Meal(
      mealTime: "10 พืชสมุนไพรประจำบ้าน",
      name: "ดูแลสุขภาพด้วยตนเอง",
      imagePath: "assets/images/fruit_granola.jpg",
      preparation:
          ''' สมุนไพรทั้ง 10 ชนิด มีประโยชน์และสรรพคุณใกล้เคียงและแตกต่างกันออกไป ได้แก่

1.กระเพราแดง 
    มีรสเผ็ดร้อน สรรพคุณแก้ปวดท้อง ท้องอืด แก้ลมจุกเสียดแน่นท้อง ขับลมทำให้เรอเหมาะสำหรับเด็ก

2.ขิง 
    มีรสเผ็ดร้อนหวาน สรรพคุณ บรรเทาอาการท้องอืด ขับลม แน่นจุกเสียด ป้องกันและบรรเทาอาการคลื่นไส้อาเจียน จากอาการเมารถ เมาเรือ

3.ตะไคร้ 
    มีรสปร่า กลิ่นหอม มีสรรพคุณขับลมในลำไส้ เจริญอาหาร ขับปัสสาวะ

4.ช้าพลู 
    มีรสเผ็ดเล็กน้อย สรรพคุณ ช่วยเจริญอาหาร ขับลม แก้ท้องอืด ท้องเฟ้อ

5.บัวบก 
    สรรพคุณตามตำรายาไทยใช้บัวบกแก้ไข้ แก้ร้อนใน แก้ช้ำใน ใช้เป็นยาภายนอกรักษาแผล ทำให้แผลหายเร็ว เป็นยาบำรุงและยาอายุวัฒนะ ช่วยเสริมสร้างความจำ ข้อมูลจากการศึกษาวิจัยในคนพบว่าบัวบกมีฤทธิ์รักษาความผิดปกติของหลอดเลือดดำ ช่วยให้คลายกังวล รักษาแผลที่ผิวหนัง และรักษาแผลในทางเดินอาหาร

6.ฟ้าทะลายโจร 
    มีรสขม สรรพคุณแก้ไข้ บรรเทาอาการเจ็บคอ บรรเทาอาการของโรคหวัด ให้ได้ผลดีต้องรับประทานทันทีเมื่อมีอาการ สำหรับข้อควรระวัง หากใช้ฟ้าทะลายโจรติดต่อกัน 3 วัน แล้วอาการไม่ดีขึ้น หรือมีอาการรุนแรงขึ้นระหว่างใช้ยา ควรหยุดใช้และปรึกษาแพทย์ สำหรับข้อห้าม ห้ามใช้ในสตรีมีครรภ์และผู้ที่แพ้ฟ้าทะลายโจร

7.มะกรูด 
    มีรสเปรี้ยว สรรพคุณผิวมะกรูด แก้อาการหน้ามืด วิงเวียน น้ำมะกรูด แก้ไอ ขับเสมหะและใช้บำรุงเส้นผม

8.มะระขี้นก 
    มีรสขมจัด สรรพคุณ แก้ไข้ แก้ร้อนใน เจริญอาหาร ผลมะระอ่อน ใช้รับประทานเป็นยาเจริญอาหารโดยการต้มให้สุกรับประทานร่วมกับน้ำพริก ถ้าผลสุกสีเหลืองห้ามรับประทาน เพราะจะทำให้มีอาการคลื่นไส้อาเจียนได้ ข้อมูลจากการศึกษาวิจัยพบว่า มะระขี้นกมีสารชาแรนตินช่วยลดน้ำตาลในเลือดของผู้ป่วยเบาหวานได้

9.ว่านหางจระเข้ 
    วุ้นของว่านหางจระเข้ มีรสเย็นจืด สรรพคุณ รักษาแผลไฟไหม้ น้ำร้อนลวก

10.สะระแหน่ 
    สรรพคุณบรรเทาอาการวิงเวียน หน้ามืด ขับลม เป็นต้น จะเห็นได้ว่าสมุนไพรใกล้ตัวมากมายเหล่านี้มีประโยชน์หาง่าย ใช้สะดวกและได้ผลดี'''),
  Meal(
      mealTime: "'ยาสมุนไพร' ไม่มี อย. ",
      name: "รักษาโรคไม่ได้ แถมเสี่ยงตับไตพัง",
      imagePath: "assets/images/pesto_pasta.jpg",
      preparation:
          ''' ผู้บริโภคหลงเชื่อโฆษณาสมุนไพรที่ไม่มี อย.รับรอง อ้างสรรพคุณรักษาโรคเกินจริง ทำผู้ป่วยอาการทรุดหนัก เสี่ยงเป็นโรคไต และอาจทำให้หัวใจวาย

    ยาสมุนไพร แม้อ้างว่ามาจากธรรมชาติ แต่ไม่ได้ดีต่อร่างกายเสมอไป

        ทั้งนี้ ขอเตือนผู้บริโภคว่า จะรับประทานยาสมุนไพรต่างๆ ต้องมีการปรึกษาผู้เชี่ยวชาญที่มีความรู้ความเข้าใจทางด้านยา เช่น เภสัชกร แพทย์แผนไทย แพทย์ทางเลือก และแพทย์แผนปัจจุบัน เพราะเราไม่ได้ห้ามไม่ให้ใช้ แต่การใช้ต้องใช้อย่างถูกต้อง ในปริมาณที่เหมาะสม ซึ่งแต่ละคน แต่ละโรคมีความแตกต่างกัน ยิ่งเป็นผู้ป่วยโรคเรื้อรัง โดยเฉพาะโรคไตจะได้รับผลกระทบเร็วมาก แค่ 1-2 วันที่ใช้ไปก็ตัวบวม เพราะเกิดของเสียคั่ง ฟอสฟอรัสสูง โพแทสเซียมสูง และทำให้หัวใจวายได้'''),
  Meal(
      mealTime: "‘หมอยา ท่าสุขสยาม’",
      name: "ตอบโจทย์ทุกไลฟ์สไตล์ในยุคดิจิทัล",
      imagePath: "assets/images/keto_snack.jpg",
      preparation:
          '''     สมุนไพรไทย ภูมิปัญญาที่อยู่คู่กับสังคมไทยมาอย่างช้านาน สะท้อนให้เห็นถึงวิถีชีวิตและสังคมในแต่ละช่วงเวลาได้อย่างชัดเจน มีการนำสมุนไพรมาใช้เป็นยารักษาโรค อาหาร รวมถึงผลิตภัณฑ์เสริมความงามในด้านต่าง ๆ 
          
          ภาพจำของสมุนไพรไทยในใจใครหลาย ๆ คน อาจจะเป็นเรื่องที่เก่า ล้าสมัย แต่สำหรับกรมการแพทย์แผนไทยและการแพทย์ทางเลือกแล้ว กรมฯมองว่าประเทศไทยเป็นแหล่งปลูกสมุนไพรชั้นดี คุณภาพพรีเมี่ยมหลากหลายชนิดและมีผลิตภัณฑ์จากสมุนไพรไทยส่งออกไปขายต่างประเทศและสร้างรายได้มหาศาล แสดงให้เห็นถึงศักยภาพและแนวโน้มการเติบโตของสมุนไพรไทย กรมจึงส่งเสริมและสนับสนุนผู้ประกอบการสมุนไพรไทยให้สามารถแข่งขันในตลาดและต่อสู้กับสมรภูมิอีคอมเมิร์ซในยุคดิจิทัลได้อย่างมีประสิทธิภาพ'''),
  Meal(
      mealTime: "'ยาสมุนไพร'",
      name: "ผู้สูงอายุควรใช้อย่างไรถึงจะดี",
      imagePath: "assets/images/pesto_pasta2.jpg",
      preparation:
          '''     การใช้ยาอย่างถูกต้องย่อมปลอดภัย และเกิดประโยชน์ตามวัตถุประสงค์ แต่ถ้าใช้ยาผิดพลาด! อาจทําให้ได้รับอันตราย โดยเฉพาะอย่างยิ่งการใช้ยาในผู้สูงอายุ ซึ่งพบว่าเป็น ผู้ที่มีความเสี่ยง หรือมีโอกาสที่จะได้รับอันตรายจากการใช้ยามากกว่าบุคคลทั่วไป 
          ฉะนั้นมาดูกันดีกว่าว่า "การใช้ยา และ สมุนไพร" สำหรับผู้สูงวัย ควรใช้อย่างไรจึงจะดี และปลอดภัย?
          
          สมุนไพรที่เกี่ยวข้องกับผู้สูงอายุมีหลายชนิด เช่น
สมุนไพรที่ช่วยลดไขมันในเลือด
    กระเทียม (หอมขาว หอมเทียม หัวเทียม)
ส่วนที่ใช้ : กระเทียมสด
วิธีใช้ : ใช้รับกินเป็นอาหาร สําหรับผู้ที่มีระดับไขมันในเลือดสูง โดยให้กินครั้งละ 5 กรัม (ประมาณ 5-7 กลีบ) วันละ 3 ครั้ง พร้อมอาหาร หรือ หลังอาหารเป็นเวลา 1 เดือน แล้วให้กินต่อไปวันละ 5 กรัม (ประมาณ 5 - 7 กลีบ)


สมุนไพรลดระดับน้ำตาลในเลือด
    มะระขี้นก (มะระเล็ก ผักไห่ มะไห่ ผักเหย)
ส่วนที่ใช้ : ผล
วิธีใช้ : นําผลสดมาปั้นหยาบๆ
คั้นเป็นน้ำสมุนไพรดื่ม หรือนําผลมาปรุงเป็นอาหาร เช่น ผัด ต้ม แกง เป็นต้น


สมุนไพรช่วยระบาย
  แมงลัก (มังลัก ก้อมก้อขาว)
ส่วนที่ใช้ : เมล็ด
วิธีที่ใช้ : ใช้เมล็ด 1 - 2 ช้อนชา
นํามาแช่น้ําจนพองตัว เต็มที่ก่อนกิน ควรกินก่อนนอน
***ข้อควรระวัง : การแช่เมล็ดแมงลักในน้ำต้องให้มีปริมาณน้ำที่มากพอ เพื่อให้เมล็ดพองตัวเต็มที่ ซึ่งถ้าเมล็ดแมงลักไม่พองตัวเต็มที่ เมื่อกินเข้าไปแล้วจะดูดน้ำในกระเพาะอาหาร และลําไส้ เมื่อเมล็ดพองตัว จะทําให้เกิดการแข็ง และอุดตัน ของกากอาหารมากยิ่งขึ้น


สมุนไพรช่วยลดอาการท้องอืด แน่นท้อง
    ขมิ้นชัน (ขมิ้น ขมิ้นแกง ขมิ้นอ้อย)
ส่วนที่ใช้ : เหง้า
วิธีที่ใช้ : ฝานขมิ้นตากแดด บดเป็นผง แล้วปั้นเป็นลูกกลอน กินครั้งละ 2 - 3 เม็ด วันละ 3 - 4 ครั้ง หลังอาหาร

เป็นอย่างไรกันบ้างเอ่ย กับเคล็ดลับ "การใช้ยา และ สมุนไพร" สำหรับผู้สูงวัย ใครที่มีผู้สูงวัยอยู่ในบ้าน สามารถนำเอาเคล็ดลับดีดีเหล่านี้ไปใช้กันได้นะคะ สุดท้ายนี้ GedGoodLife ขอให้ผู้สูงวัยทุกท่าน มีสุขภาพแข็งแรง อายุยืน เป็นร่มโพธิ์ร่มไทรให้ลูกหลานไปนาน ๆ '''),
];
