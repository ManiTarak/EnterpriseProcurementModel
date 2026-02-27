module.exports = cds.service.impl(async function(){
    const {POEntitySet}=this.entities;
    this.on("READ",POEntitySet,async (req,res)=>{
       return cds.run(SELECT.from(POEntitySet).where({
        "GROSS_Amount":{
            '>':1800
        }
       }));
    });
})